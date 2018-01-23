alias ls="ls --color=auto --group-directories-first"
alias dmesg="dmesg --color"
alias update="sudo pacman -Syyu"
alias inst="sudo pacman -S"
alias searchfor="pacman -Ss"
alias gc="git clone"
alias mkdir="mkdir -p"
alias zshrc="nvim ~/.zshrc"
alias bspwmrc="nvim ~/.config/bspwm/bspwmrc"
alias sxhkdrc="nvim ~/.config/sxhkd/sxhkdrc"
alias initvim="nvim ~/.config/nvim/init.vim"

function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

setopt COMPLETE_ALIASES

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' group-name ''

autoload -Uz compinit promptinit
compinit
promptinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd extendedglob
unsetopt appendhistory beep nomatch notify
bindkey -v

[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx
