#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $list = $ARGV[0];
open(L, $list);
my %h;
while (my $line = <L>) {
	$line =~ s/^\s+//;
	$line =~ s/\s+$//;
	$h{$line}++;
}
foreach my $line (sort keys %h) {
	print "$line\t$h{$line}\n";
}

