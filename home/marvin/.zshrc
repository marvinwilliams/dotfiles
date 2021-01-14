HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory autocd extendedglob complete_aliases
unsetopt beep nomatch
bindkey -e

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' rehash true
zstyle :compinstall filename '/home/marvin/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

if [[ -n $SSH_CONNECTION ]]; then
  PROMPT=' %(!.%F{red}.%F{blue})░%f [%M] %(!.%F{red}.%F{blue})∼ %f'
else
  PROMPT=' %(!.%F{red}.%F{blue})░ ∼ %f'
fi
RPROMPT='%F{white}%~ [%1x: %0(?.%F{green}.%F{red})%?%F{white}]%f'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias ssh="TERM=xterm-color ssh"
alias ls='ls --color=auto --group-directories-first'
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

eval "$(direnv hook zsh)"
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export SYSTEMD_EDITOR="nvim"
alias unlock='export BW_SESSION=$(bw unlock --raw $(gpg --decrypt -q -r 00656DCAB197A6FA9A4861E27CD02747DC7069D3 /home/marvin/.bwaccount.gpg))'
alias inst='sudo pacman -S'
alias update='sudo pacman -Syu'
alias sstart='sudo systemctl start'
alias sstop='sudo systemctl stop'
alias senable='sudo systemctl enable'
alias sdisable='sudo systemctl disable'
