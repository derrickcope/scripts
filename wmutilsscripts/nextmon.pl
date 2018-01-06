#!/usr/bin/perl
#
chomp($PFW = `pfw`);

chomp($XPFW = `wattr x $PFW`);

chomp($YPFW = `wattr y $PFW`);

chomp($WPFW = `wattr w $PFW`);

chomp($HPFW = `wattr h $PFW`);

$NEWXPFW = $XPFW + 1920;


`wtp $NEWXPFW $YPFW $WPFW $HPFW $PFW`;
`chwso -r $PFW`;
`wtf $PFW`;
`wmp $NEWXPFW $YPFW`;
