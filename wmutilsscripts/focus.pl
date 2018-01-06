#!/usr/bin/perl 
#
$aurg = @ARGV[0];

chomp($pfw = `pfw`);
`chwb -c 0x696969 -s 2 $pfw`;

$lsw = `lsw`;
@wid = split /\n/, $lsw;


$id = 0;
foreach $win (@wid) {
    
    chomp($winh = `wattr h $win`);
    if ($winh < 30) {
        
    } else {
    $wid{$win} = $id;
    
        if ($win eq $pfw) {
            $winnum = $id;
            
        }
    
        $id++;
    }
}


$id -= 1;

%rwid = reverse %wid;


if ($aurg eq "next") {
    $winnum += 1;
    

    if ($winnum < $id) {
        chomp($nextx = `wattr x $rwid{$winnum}`);
        chomp($nexty = `wattr y $rwid{$winnum}`);
        `wtf $rwid{$winnum}`;
        `chwso -r $rwid{$winnum}`;
        `wmp $nextx $nexty`;
        `chwb -c 0x1793d1 -s 2  $rwid{$winnum}`;

    } else {
        chomp($nextx = `wattr x $rwid{0}`);
        chomp($nexty = `wattr y $rwid{0}`);
        `wtf $rwid{0}`;
        `chwso -r $rwid{0}`;
        `wmp $nextx $nexty`;
        `chwb -c 0x1793d1 -s 2 $rwid{0}`; 
    }    
} elsif ($aurg eq "prev") {
    $winnum -= 1;

    if ($winnum > 0) {
        chomp($nextx = `wattr x $rwid{$winnum}`);
        chomp($nexty = `wattr y $rwid{$winnum}`);
        `wtf $rwid{$winnum}`;
        `chwso -r $rwid{$winnum}`;
        `wmp $nextx $nexty`;
    
        `chwb -c 0x1793d1 -s 2 $rwid{$winnum}`; 

    } else {
        chomp($nextx = `wattr x $rwid{$id}`);
        chomp($nexty = `wattr y $rwid{$id}`);
        `wtf $rwid{$id}`;
        `chwso -r $rwid{$id}`;
        `wmp $nextx $nexty`;
 
        `chwb -c 0x1793d1 -s 2 $rwid{$id}`;        
 
    }
} else {
    chomp($nextx = `wattr x $aurg`);
    chomp($nexty = `wattr y $aurg`);
    `wtf $aurg`;
    `chwso -r $aurg`;
##    `wmp $nextx $nexty`;      #comment out for sloppy focus when @ARGV is window id
    `chwb -c 0x1793d1 -s 2 $aurg`;
}
