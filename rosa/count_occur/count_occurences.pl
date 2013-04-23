#!/usr/bin/perl

use strict;
use warnings;

my $infile = $ARGV[0];
my %ctgs;
open(F, $infile);
while (<F>) {
	my ($frst, $scnd) = split(/\s+/);
	$ctgs{$frst}{$scnd}++ if ($frst !~ /^\s*$/);
}
close(F);

foreach my $ctg (sort keys %ctgs) {
	my $count = (keys %{$ctgs{$ctg}});
	print $ctg."\t".$count."\n";
}
