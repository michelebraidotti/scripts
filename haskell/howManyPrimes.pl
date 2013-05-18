#!/usr/bin/perl 

use strict;
use warnings;

my $max = $ARGV[0];
my $count = 0;
for my $prime ( 2 .. $max ) {
	$count++ if ( is_prime($prime) );
}
print "$count\n";

sub is_prime {
	my $num = shift;
	for my $i ( 2 .. $num -1 ) {
		return 0 if ( $num % $i == 0 );
	}
	return 1;
}
