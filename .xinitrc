#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)



#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi


#[[ -f ~/.Xresources ]] && xrdb -merge $HOME ~/.Xresources
#screenlayout
~/.screenlayout/default.sh

# feh background
feh --bg-fill $HOME/pictures/wallpapers/paisleyskull.png

#set cursor
xsetroot -cursor_name left_ptr

#config Chinese input
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_MODULE=fcitx

# Autostart
udiskie &
#stalonetray &
dunst &
#volumeicon &
#firefox &
#urxvt -e vifm &
#urxvt -e ranger &
#urxvt -e mutt &
#urxvt -e ncmpc &
#urxvt -title todoist &
#urxvt -title terminal1 &
#urxvt -title connman &
#pavucontrol &
#screenkey &

# change CAP key to esc for vim
#xmodmap -e 'clear Lock' -e 'keycode 66 = Escape Caps_Lock NoSymbol NoSymbol'

#lemonbar.pl | lemonbar -p -g 1880x20+2+0 & 

sxhkd -m -1 &

#xbindkeys &

# MPD deamon
#[ ! -s ~/.config/mpd/pid ] && mpd

#exec swm
#exec urxvt  
#exec tinywm
#exec pwm
#exec openbox-session
exec bspwm

