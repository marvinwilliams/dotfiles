[ -f ~/.xprofile ] && source ~/.xprofile

xrandr	--output DVI-0 --mode 1680x1050 --pos 0x30 \
	--output HDMI-0 --mode 1920x1080 --pos 1680x0 --primary
export SXHKD_SHELL='/usr/bin/sh'
wmname LG3D

exec bspwm
