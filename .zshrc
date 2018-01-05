zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle :compinstall filename '/home/marvin/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd extendedglob
unsetopt appendhistory beep nomatch notify
bindkey -v

export EDITOR=nvim

alias ls="ls --color=auto --group-directories-first"
alias dmesg="dmesg --color"
alias updt="sudo pacman -Syyu"
alias zshrc="nvim ~/.zshrc"
alias initvim="nvim ~/.config/nvim/init.vim"
alias inst="sudo pacman -S"
alias search="pacman -Ss"
alias bspwmrc="vim ~/.config/bspwm/bspwmrc"
alias sxhkdrc="vim ~/.config/sxhkd/sxhkdrc"
alias gc="git clone"

[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx
