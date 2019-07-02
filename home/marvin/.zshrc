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
