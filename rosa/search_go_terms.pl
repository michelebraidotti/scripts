#!/usr/bin/perl

use strict;
use warnings;

my $infile = $ARGV[0];
open(F, $infile);
my $href;
while (my $line = <F>) {
	my ($id, undef) = split(/\s+/, $line);
	if ($id) {
		my @matches = $line =~ /(GO:\d+)/g;
		print "$id\t";
		foreach my $m (@matches) {
			print "$m\t";
		}
		print "\n";
	}
}
