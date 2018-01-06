#!/bin/sh

# get current window id, width and height
WID=$(pfw)
WW=$(wattr w $WID)
WH=$(wattr h $WID)

# get screen width and height
ROOT=$(lsw -r)
SW=$(wattr w $ROOT)
SH=$(wattr h $ROOT)
NWW=$(((SW/4) - 60))
NWH=$(((SH) - 60))

# move the current window to the center of the screen
wtp $(((SW - WW)/2)) $(((SH - WH)/2)) $NWW $NWH $WID

