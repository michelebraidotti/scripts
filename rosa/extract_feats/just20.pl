#!/usr/bin/perl
use strict;
use warnings;

my $MAX_OCCUR = 20;

open(F, $ARGV[0]);
my $prev_contig = "";
my $occurences = 0;

while ( my $line = <F> ) {
	my ($contig) = split(/\s+/, $line);
	if ( $contig ne $prev_contig ) {
		$prev_contig = $contig;
		$occurences = 0;
	}
	$occurences++;
	if ( $occurences <= $MAX_OCCUR ) {
		print $line;
	}
}
