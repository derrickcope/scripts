#!/usr/bin/perl
# derrickcope - 2016 fullscreen.pl
# /.bin/fullscreen.pl
# make current window full monitor for multihead setup with arandr
#
# set size of gaps and size of panel
$PANEL = 20;
$GAP = 20;

# height and width of mon1 and mon2
$MFW = 1920;
$MFH = 1080;
$MSW = 1920;
$MSH = 1080;


# get wid of currently focused window
$PFW = `pfw`;

$PWX = `wattr x $PFW`;
$SX = $MSW + $GAP;
$SY = $PANEL + $GAP;
$SW = $MSW - $GAP * 2;
$SH = $MSH - $PANEL - $GAP * 2;
$FX = $GAP;
$FY = $PANEL + $GAP;
$FW = $MFW - $GAP * 2;
$FH = $MFH - $PANEL - $GAP * 2;

if ($PWX > 1920) {
    `wtp $SX $SY $SW $SH $PFW`;
    `chwso -r $PFW`;
    `wtf $PFW`;
    `wmp $SX $SY`;
}
else {
    `wtp $FX $FY $FW $FH $PFW`;
    `chwso -r $PFW`;
    `wtf $PFW`;
    `wmp $FX $FY`;

}

