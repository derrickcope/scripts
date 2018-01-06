#!/usr/bin/perl
#

$PANEL = 20;
$GAP = 20;
$MASTER = 960;

$PFW = `pfw`;
#print $PFW;
$BW = `wattr b $PFW`;

#print $BW;
#
$X = $MASTER + $GAP;
$Y = $GAP + $PANEL;
$H = 1080 - $GAP -$PANEL - $GAP;
$W = $MASTER - $GAP - $GAP;

`wtp $GAP $Y $W $H $PFW`;
