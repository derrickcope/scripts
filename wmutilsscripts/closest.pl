#!/usr/bin/perl
#
#script to find the next window to the right or left using wmutils
#depends on wmutils core asd opt

use Getopt::Long;
#use Data::Dumper;

#get arguments for either next window or prev windows from command line
GetOptions (
    "next" => \$next,
    "prev" => \$prev,
) or die "invalid argument to $0\n";

#set width and color for borders
$actwidth = 2;
$inactwidth = 2;
$active = '0x1793d1';
$inactive = '0x696969';

#get current window id and change border of current window to inactive
chomp($cur = `pfw`);
`chwb -c $inactive -s $inactwidth $cur`;

#list window ids except bar and systray
$winlist = `lsw`;
@winlist = split /\n/, $winlist;

#print Dumper (\@winlist); #debug array of window ids

#create hash of window ids keys with x position as values
foreach $tempwin (@winlist) {
    chomp($winh = `wattr h $tempwin`);
    chomp($winx = `wattr x $tempwin`);
    if ($winh < 30) {
    } else { 
         $winlist{$tempwin} = $winx;
    }
}
#print Dumper (\%winlist); #debug hash

#sort the keys of the hash depending on the value of x position
@sortwinlist = sort by_ascendx keys %winlist if ($next);
@sortwinlist = sort by_descendx keys %winlist if ($prev);
sub by_ascendx { $winlist{$a} <=> $winlist{$b} }
sub by_descendx { $winlist{$b} <=> $winlist{$a} }

#print Dumper (\@sortwinlist); #debug sorted list of window ids

#find currently focused window in array and focus on the following window
$id = 0;
foreach $sortwinlist ( @sortwinlist) {
    if ( $sortwinlist eq $cur) {
#        print "$id\n"; #debug which is current window id and counter
        $id += 1;
    } elsif ( $id == 1 ) {
#        print "$id\n"; #debug counter 
#        print "$sortwinlist\n"; #debug which window id will focus to 
        chomp($mousex = `wattr x $sortwinlist`);
        chomp($mousey = `wattr y $sortwinlist`);
        `wtf $sortwinlist`;
        `chwso -r $sortwinlist`;
        `wmp -a $mousex $mousey`;
        `chwb -c $active -s $actwidth $sortwinlist`;
        $id += 1;
    } else { 
#        print "$id\n"; #debug counter
    }
}

