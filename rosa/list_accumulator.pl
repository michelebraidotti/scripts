#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $list = $ARGV[0];
open(L, $list);
my $h;
while (my $line = <L>) {
	my ($k, $v) = split(/\s+/, $line);
	push(@{$h->{$k}}, $v);	
}

foreach my $k (sort keys %$h) {
	my $out = "$k\t";
	foreach my $v (@{$h->{$k}}) {
		$out .= $v.";";
	}
	$out =~ s/;$//;
	print "$out\n";
}
