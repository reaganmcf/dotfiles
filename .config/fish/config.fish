### MANPAGER
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

### EXPORTS
export BROWSER="google-chrome"

### ALIASES
alias clears="clear; source ~/.config/fish/config.fish"
alias vim="nvim"
alias cp="cp -i"
alias ls="exa --icons -l"
alias llightmon="~/Code/lightmon/target/debug/lightmon"

# configs
alias editspacevim="vim ~/.SpaceVim.d/init.toml"
alias editnvim="vim ~/.config/nvim/init.vim"
alias editfish="vim ~/.config/fish/config.fish"
alias editrofi="vim ~/.config/rofi/config.rasi"

# git aliases
alias gs="git status"
alias ga="git add"
alias gc="gitmoji -c"
alias gp="git push"

# mon2cam
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

### ColorScript
#colorscript -e crunch

### Disable greeting
set fish_greeting

### STARSHIP
starship init fish | source


