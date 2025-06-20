#
# ~/.bashrc
#

[[ $- != *i* ]] && return

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

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

### ALIASES ###
EDITOR="vim"
alias clears="clear; source ~/.bashrc"
alias vim="nvim"

### CONFIG ALIASES
alias editbash="vim ~/.bashrc"
alias editnix="sudo vim /etc/nixos/configuration.nix"
alias edithypr="vim ~/.config/hyprland/hyprland.conf"

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
