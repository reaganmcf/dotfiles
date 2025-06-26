import os
import sys
import argparse
import platform
from pathlib import Path
import subprocess

DOTFILES_CONFIG = {
    '.tmux.conf': {
        'linux': '~/.tmux.conf',
        'macos': '~/.tmux.conf',
        'windows': '~/.tmux.conf'
    },
    '.alacritty.yml': {
        'linux': '~/.alacritty.yml',
        'macos': '~/.alacritty.yml',
        'windows': None 
    },
    '.config/nvim': {
        'linux': '~/.config/nvim',
        'macos': '~/.config/nvim',
        'windows': '$LOCALAPPDATA/nvim'
    },
    '.config/hypr/hyprland.conf': {
        'linux': '~/.config/hypr/hyprland.conf',
        'macos': None,
        'windows': None
    },
    '.config/rofi/config.rasi': {
        'linux': '~/.config/rofi/config.rasi',
        'macos': None,
        'windows': None
    },
    '.bashrc': {
        'linux': '~/.bashrc',
        'macos': '~/.bashrc',
        'windows': None # '~/.zshrc'
    }
}

class DotfilesManager:
    def __init__(self):
        self.system = platform.system().lower()
        self.script_dir = Path(__file__).parent.absolute()
        self.home_dir = Path.home()
        
        # Map system names
        self.platform_map = {
            'linux': 'linux',
            'darwin': 'macos',
            'windows': 'windows'
        }
        
        self.current_platform = self.platform_map.get(self.system)
        if not self.current_platform:
            print(f"Unsupported platform: {platform.system()}")
            sys.exit(1)
    
    def expand_path(self, path_str):
        """Expand environment variables and user home in path strings"""
        # Handle common path variables
        path_str = path_str.replace('~', str(self.home_dir))
        path_str = path_str.replace('$HOME', str(self.home_dir))
        
        if self.system == 'windows':
            path_str = path_str.replace('$APPDATA', os.environ.get('APPDATA', str(self.home_dir / 'AppData/Roaming')))
            path_str = path_str.replace('$LOCALAPPDATA', os.environ.get('LOCALAPPDATA', str(self.home_dir / 'AppData/Local')))
            path_str = path_str.replace('$USERPROFILE', str(self.home_dir))
        
        # Expand any remaining environment variables
        path_str = os.path.expandvars(path_str)
        
        return Path(path_str)
    
    def get_destination_path(self, source_path):
        """Get the destination path for a source file on the current platform"""
        if source_path not in DOTFILES_CONFIG:
            return None
        
        destinations = DOTFILES_CONFIG[source_path]
        
        if self.current_platform not in destinations:
            print(f"Warning: No destination defined for {source_path} on {self.current_platform}")
            return None
        
        return self.expand_path(destinations[self.current_platform])
    
    def prompt_user(self, message):
        """Prompt user for yes/no confirmation"""
        while True:
            try:
                response = input(f"{message} (y/N): ").strip().lower()
                if response in ['y', 'yes']:
                    return True
                elif response in ['n', 'no', '']:
                    return False
                else:
                    print("Please enter 'y' for yes or 'n' for no.")
            except (EOFError, KeyboardInterrupt):
                print("\nOperation cancelled.")
                return False
    
    def create_symlink(self, source, target, interactive=True):
        """Create a symlink, handling platform differences"""
        try:
            # Create parent directories if they don't exist
            target.parent.mkdir(parents=True, exist_ok=True)
            
            # Handle existing files/links
            if target.exists() or target.is_symlink():
                if target.is_symlink():
                    # Check if it already points to our source
                    try:
                        if target.resolve() == source:
                            print(f"✓ {source.name} already linked correctly")
                            return True
                    except OSError:
                        pass  # Broken symlink, we'll replace it
                    
                    if interactive:
                        print(f"Symlink already exists: {target}")
                        if target.exists():
                            link_target = target.resolve()
                            print(f"Currently points to: {link_target}")
                        else:
                            print("Currently points to: (broken link)")
                    
                    if not interactive or self.prompt_user(f"Replace existing symlink for {source.name}?"):
                        target.unlink()
                    else:
                        print(f"Skipped {source.name}")
                        return False
                        
                elif target.is_file():
                    if interactive:
                        print(f"File already exists: {target}")
                        print(f"Size: {target.stat().st_size} bytes")
                        if not self.prompt_user(f"Replace existing file for {source.name}?"):
                            print(f"Skipped {source.name}")
                            return False
                    
                    # Remove the existing file
                    target.unlink()
                    print(f"Removed existing file: {target}")
                    
                elif target.is_dir():
                    if interactive:
                        print(f"Directory already exists: {target}")
                        if not self.prompt_user(f"Replace existing directory for {source.name}?"):
                            print(f"Skipped {source.name}")
                            return False
                    
                    # Remove the existing directory
                    import shutil
                    shutil.rmtree(target)
                    print(f"Removed existing directory: {target}")
            
            # Create symlink
            if self.system == 'windows':
                # On Windows, use mklink command for better compatibility
                if source.is_dir():
                    subprocess.run(['mklink', '/D', str(target), str(source)], 
                                 shell=True, check=True, capture_output=True)
                else:
                    subprocess.run(['mklink', str(target), str(source)], 
                                 shell=True, check=True, capture_output=True)
            else:
                # Unix-like systems
                target.symlink_to(source)
            
            print(f"✓ Linked {source.name} -> {target}")
            return True
            
        except (OSError, subprocess.CalledProcessError) as e:
            print(f"✗ Failed to link {source.name}: {e}")
            if self.system == 'windows':
                print("  Note: On Windows, you may need to run as Administrator or enable Developer Mode")
            return False
    
    def remove_symlink(self, target):
        """Remove a symlink if it exists and points to our dotfiles"""
        try:
            if target.is_symlink():
                # Check if it points to our dotfiles directory
                link_target = target.resolve()
                if str(link_target).startswith(str(self.script_dir)):
                    target.unlink()
                    print(f"✓ Removed {target}")
                    return True
                else:
                    print(f"⚠ Skipping {target} (points elsewhere)")
            elif target.exists():
                print(f"⚠ Skipping {target} (not a symlink)")
            return False
        except OSError as e:
            print(f"✗ Failed to remove {target}: {e}")
            return False
    
    def get_valid_dotfiles(self):
        """Get list of dotfiles that exist and are configured"""
        valid_files = []
        
        for source_path in DOTFILES_CONFIG:
            source_file = self.script_dir / source_path
            if source_file.exists():
                destination = self.get_destination_path(source_path)
                if destination:
                    valid_files.append((source_file, destination))
            else:
                print(f"Warning: Configured file {source_path} not found in {self.script_dir}")
        
        return valid_files
    
    def sync(self, specific_file=None, force=False):
        """Sync dotfiles by creating symlinks"""
        if specific_file:
            print(f"Syncing {specific_file} on {platform.system()}...")
            return self._sync_single_file(specific_file, force)
        else:
            print(f"Syncing all dotfiles on {platform.system()}...")
            print(f"Source directory: {self.script_dir}")
            print(f"Target directory: {self.home_dir}")
            print()
            
            dotfiles = self.get_valid_dotfiles()
            if not dotfiles:
                print("No valid dotfiles found to sync!")
                return
            
            success_count = 0
            for source, target in dotfiles:
                if self.create_symlink(source, target, interactive=not force):
                    success_count += 1
            
            print(f"\nSynced {success_count}/{len(dotfiles)} dotfiles successfully!")
    
    def _sync_single_file(self, file_path, force=False):
        """Sync a single dotfile"""
        if file_path not in DOTFILES_CONFIG:
            print(f"Error: {file_path} is not configured in DOTFILES_CONFIG")
            print(f"Available files: {', '.join(DOTFILES_CONFIG.keys())}")
            return False
        
        source_file = self.script_dir / file_path
        if not source_file.exists():
            print(f"Error: {file_path} not found in {self.script_dir}")
            return False
        
        destination = self.get_destination_path(file_path)
        if not destination:
            return False
        
        success = self.create_symlink(source_file, destination, interactive=not force)
        if success:
            print(f"\nSuccessfully synced {file_path}!")
        return success
    
    def unlink(self, specific_file=None):
        """Remove symlinks created by this script"""
        if specific_file:
            print(f"Removing {specific_file} symlink on {platform.system()}...")
            return self._unlink_single_file(specific_file)
        else:
            print(f"Removing all dotfile symlinks on {platform.system()}...")
            print()
            
            dotfiles = self.get_valid_dotfiles()
            if not dotfiles:
                print("No valid dotfiles found!")
                return
            
            success_count = 0
            for source, target in dotfiles:
                if self.remove_symlink(target):
                    success_count += 1
            
            print(f"\nRemoved {success_count} symlinks!")
    
    def _unlink_single_file(self, file_path):
        """Unlink a single dotfile"""
        if file_path not in DOTFILES_CONFIG:
            print(f"Error: {file_path} is not configured in DOTFILES_CONFIG")
            print(f"Available files: {', '.join(DOTFILES_CONFIG.keys())}")
            return False
        
        destination = self.get_destination_path(file_path)
        if not destination:
            return False
        
        success = self.remove_symlink(destination)
        if success:
            print(f"\nSuccessfully removed {file_path} symlink!")
        return success
    
    def status(self, specific_file=None):
        """Show status of dotfile symlinks"""
        if specific_file:
            print(f"Status for {specific_file} on {platform.system()}:")
            return self._status_single_file(specific_file)
        else:
            print(f"Dotfiles status on {platform.system()}:")
            print(f"Source directory: {self.script_dir}")
            print()
            
            dotfiles = self.get_valid_dotfiles()
            if not dotfiles:
                print("No valid dotfiles found!")
                return
            
            for source, target in dotfiles:
                if target.is_symlink():
                    link_target = target.resolve()
                    if link_target == source:
                        status = "✓ Linked"
                    else:
                        status = f"⚠ Linked elsewhere ({link_target})"
                elif target.exists():
                    status = "⚠ File exists (not symlinked)"
                else:
                    status = "✗ Not linked"
                
                print(f"{source.name:<25} -> {target} [{status}]")
            
            # Show any configured files that don't exist
            print("\nConfigured but missing files:")
            for source_path in DOTFILES_CONFIG:
                source_file = self.script_dir / source_path
                if not source_file.exists():
                    print(f"✗ {source_path}")
    
    def _status_single_file(self, file_path):
        """Show status for a single dotfile"""
        if file_path not in DOTFILES_CONFIG:
            print(f"Error: {file_path} is not configured in DOTFILES_CONFIG")
            print(f"Available files: {', '.join(DOTFILES_CONFIG.keys())}")
            return False
        
        source_file = self.script_dir / file_path
        if not source_file.exists():
            print(f"✗ Source file {file_path} not found in {self.script_dir}")
            return False
        
        destination = self.get_destination_path(file_path)
        if not destination:
            return False
        
        print(f"Source: {source_file}")
        print(f"Target: {destination}")
        
        if destination.is_symlink():
            link_target = destination.resolve()
            if link_target == source_file:
                print("Status: ✓ Linked correctly")
            else:
                print(f"Status: ⚠ Linked elsewhere ({link_target})")
        elif destination.exists():
            print("Status: ⚠ File exists (not symlinked)")
        else:
            print("Status: ✗ Not linked")
        
        return True
    
    def list_files(self):
        """List all configured dotfiles"""
        print("Configured dotfiles:")
        print(f"Platform: {self.current_platform}")
        print()
        
        for source_path in sorted(DOTFILES_CONFIG.keys()):
            source_file = self.script_dir / source_path
            destination = self.get_destination_path(source_path)
            exists = "✓" if source_file.exists() else "✗"
            
            print(f"{exists} {source_path}")
            if destination:
                print(f"    → {destination}")
            print()


def main():
    parser = argparse.ArgumentParser(
        description="Cross-platform dotfiles manager",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python dotfiles sync                    # Create symlinks for all dotfiles
  python dotfiles sync .tmux.conf         # Sync only .tmux.conf
  python dotfiles sync --force             # Sync all without prompting
  python dotfiles unlink                  # Remove all dotfile symlinks
  python dotfiles unlink .config/nvim     # Remove only nvim symlink
  python dotfiles status                  # Show status of all dotfiles
  python dotfiles status .vimrc           # Show status of .vimrc only
  python dotfiles list                    # List all configured dotfiles
        """
    )
    
    parser.add_argument(
        'command',
        choices=['sync', 'unlink', 'status', 'list'],
        help='Command to execute'
    )
    
    parser.add_argument(
        'file',
        nargs='?',
        help='Specific dotfile to operate on (optional)'
    )
    
    parser.add_argument(
        '--force', '-f',
        action='store_true',
        help='Force operation without prompting (for sync command)'
    )
    
    if len(sys.argv) == 1:
        parser.print_help()
        return
    
    args = parser.parse_args()
    manager = DotfilesManager()
    
    try:
        if args.command == 'sync':
            manager.sync(args.file, args.force)
        elif args.command == 'unlink':
            if args.force:
                print("Warning: --force flag is not applicable to unlink command")
            manager.unlink(args.file)
        elif args.command == 'status':
            if args.force:
                print("Warning: --force flag is not applicable to status command")
            manager.status(args.file)
        elif args.command == 'list':
            if args.file:
                print("Warning: 'list' command doesn't accept a file argument")
            if args.force:
                print("Warning: --force flag is not applicable to list command")
            manager.list_files()
    except KeyboardInterrupt:
        print("\nOperation cancelled by user")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)


if __name__ == '__main__':
    main()
