#!/bin/sh
#
# kalq
# returns the window IDs of the windows that the mouse is hovering over

mouse_x=$(wmp | cut -d' ' -f1)
mouse_y=$(wmp | cut -d' ' -f2)

for i in $(lsw | sed '1!G;h;$!d');
do
    win_x=$(wattr x $i)
    win_y=$(wattr y $i)
    win_width=$(wattr w $i)
    win_height=$(wattr h $i)

    if [ "$mouse_x" -ge "$win_x" -a "$mouse_x" -le $((win_x + win_width)) ] ; then
        if [ "$mouse_y" -ge "$win_y" -a "$mouse_y" -le $((win_y + win_height)) ] ; then
            echo $i
    
        fi
    
    fi
done
