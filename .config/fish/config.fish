### MANPAGER
export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

### EXPORTS
export BROWSER="firefox-developer-edition"
export VISUAL=nvim
export EDITOR="$VISUAL"

### ALIASES
alias clears="clear; source ~/.config/fish/config.fish"
alias vim="nvim"
alias cp="cp -i"
alias la="exa --icons -l"
alias ls="exa"
alias rgrep="grep -r"

# debug locals
alias llightmon="~/Code/lightmon/target/debug/lightmon"
alias nneovide="~/Code/neovide/target/debug/neovide"

# configs
alias editspacevim="vim ~/.SpaceVim.d/init.toml"
alias editnvim="vim ~/.config/nvim/init.vim"
alias editfish="vim ~/.config/fish/config.fish"
alias editrofi="vim ~/.config/rofi/config.rasi"

# deno
export DENO_INSTALL="/home/rmcf/.deno"
set PATH $DENO_INSTALL/bin $PATH

# git aliases
alias gs="git status"
alias ga="git add"
alias gc="gitmoji -c"
alias gp="git push"

# mon2cam
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

# cargo
set PATH $HOME/.cargo/bin $PATH

# linuxbrew
set PATH /home/linuxbrew/.linuxbrew/bin $PATH

# java jdk 15
set PATH /home/rmcf/JAVA/jdk_15/bin $PATH

# ruby
set PATH /home/rmcf/.local/share/gem/ruby/3.0.0/bin $PATH

### Disable greeting
set fish_greeting

### ColorScript
colorscript -e crunchbang

### STARSHIP
starship init fish | source
