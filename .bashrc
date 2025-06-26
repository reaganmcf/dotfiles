#
# ~/.bashrc
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't duplicate lines or lines starting with space in history
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Enable color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
export TERM=xterm-256color

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

### PATH Modifiers ###
if [ -f "$HOME/.config/env" ]; then
  . $HOME/.config/env
fi

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases

### ALIASES ###
alias nvim="$HOME/tools/nvim/bin/nvim"
EDITOR="nvim"
alias clears="clear; source ~/.bashrc"
alias vim="nvim"

### CONFIG ALIASES
alias editbash="$EDITOR ~/.bashrc"
alias editnix="sudoedit /etc/nixos/configuration.nix"
alias edithypr="$EDITOR ~/.config/hypr/hyprland.conf"
alias editrofi="$EDITOR ~/.config/rofi/config.rasi"

### MANPAGER
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

### GIT ALIASES
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gap="git add --patch"

### STARSHIP
eval "$(starship init bash)"
