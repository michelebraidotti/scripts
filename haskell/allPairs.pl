#!/usr/bin/perl

use warnings;
use strict;

my @a = ('a','b','c');
for ( my $i = 0; $i <= $#a; $i++) {	
	for ( my $j = 0; $j <= $#a; $j++) {	
		print "[".$a[$i].",".$a[$j]."], ";
	}
}
print "\n";
