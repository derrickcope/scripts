#! /usr/bin/env perl
##############################################################################################
## Short description for nextwin.pl                                                               
##                                                                                
##                                                                                          
##                                                                                         
##############################################################################################
## Author derrick cope <derrick(at)thecopes.me>                                                  
## Version 0.1                                                         
## Copyright (C) 2017 derrick cope <derrick(at)thecopes.me>                            
## Modified On 2017-01-14 20:51                                                                      
## Created  2017-01-14 20:51                                                                        
##############################################################################################
use strict;
use warnings;
use 5.022;

use Getopt::Long;
use Data::Dumper;

chomp ( my $pfw = `pfw` );
#say $pfw;

chomp ( my $pfwx = `wattr x $pfw` );
#say $pfwx;

my %win_id_x;
my @win_id_list = split /\n/, ( my $win_id_list = `lsw` );
foreach (@win_id_list) {
    
    if ( `wattr x $_` >= $pfwx && `wattr h $_` > 30 && $_ ne $pfw ) {
        chomp( my $temp_x = `wattr x $_` ); 
    
        $win_id_x{ $temp_x } = $_;
    } 
}
print Dumper \%win_id_x;

# Get the arguments
GetOptions (
    "right" => \&right,
    "left" => \&left,

) or die "invalid argument $0\n";


sub right {
    my @sorted_win_x = sort { $a <=> $b } keys %win_id_x;
    print "@sorted_win_x\n";
    chomp ( my $gox = `wattr x $win_id_x{ $sorted_win_x[0] }` );
    chomp ( my $goy = `wattr y $win_id_x{ $sorted_win_x[0] }` );
    `chwb -c 0x696969 -s 1 $pfw`;
    `wmp -a $gox $goy`;
    `wtf $win_id_x{ $sorted_win_x[0] }`;
    `chwso -r $win_id_x{ $sorted_win_x[0] }`;
    `chwb -c 0x1793d1 -s 2 $win_id_x{ $sorted_win_x[0] }`;
    


}

sub left {
    say "left";
}


