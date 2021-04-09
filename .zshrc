### MANPAGER ###
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

### ALIASES ###
alias ls='ls -G'
alias clears="clear; source ~/.zshrc"
# macos only
alias finder="open"

# git aliases
alias gs="git status"
alias ga="git add"
alias gc="gitmoji -c"
alias gp="git push"

### COLOR SCRIPT ###
colorscript -e crunch

### STARSHIP ###
eval "$(starship init zsh)"
