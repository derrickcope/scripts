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
chomp($PFW = `pfw`);
chomp($PWX = `wattr x $PFW`); 
$LSW = `lsw`;
#print $LSW;
@WID = split /\n/, $LSW;
#print @WID;

$SWIN = '970 40 920 500';
$TWIN = '970 560 920 500';
$FWIN = '1940 40 920 1020';
$VWIN = '2890 40 920 500';
$VIWIN = '2890 560 920 500';
@WIN = ( $SWIN, $TWIN, $FWIN, $VWIN, $VIWIN );

$FX = $GAP;
$FY = $PANEL + $GAP;
$FW = $MFW / 2 - $GAP * 2;
$FH = $MFH - $PANEL - $GAP * 2;

$X = 0;
foreach $WID (@WID) {
    chomp($WAX = `wattr x $WID`);
    chomp($WAH = `wattr h $WID`);

    if ($WAH <= 20) {
    }   
    elsif ($WID eq $PFW) {
        `wtp $FX $FY $FW $FH $PFW`;
    } else {
       `wtp $WIN[$X] $WID`;
        $X++;
    
    }
}

