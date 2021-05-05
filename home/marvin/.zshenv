export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export SYSTEMD_EDITOR="nvim"
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export CDPATH=$HOME/Promotion/Forschung
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH
