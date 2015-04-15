#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my $occorenze_file = $ARGV[0];
open(F, $occorenze_file);
my %occurences;
while (my $line = <F>) {
	my ($seq, $count) = $line =~ /^>\s*(\w+)\s*\((\d+)\)\s*$/;
	if ( $seq ) { $occurences{$seq} += $count; }
}
print Dumper(\%occurences);
close(F);
foreach my $seq (keys %occurences) {
	print ">$seq(".$occurences{$seq}.")\n";
}
