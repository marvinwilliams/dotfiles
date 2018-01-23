[ -f ~/.xprofile ] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xrandr	--output DVI-0 --mode 1680x1050 --pos 0x30 \
	--output HDMI-0 --mode 1920x1080 --pos 1680x0 --primary

export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true'

wmname LG3D


compton &	
dunst &

xset dpms
xset b off

udiskie -aT2 &

export SXHKD_SHELL='/usr/bin/sh'
sxhkd -m 1 &
exec bspwm
