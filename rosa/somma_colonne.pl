#!/usr/bin/perl

use strict;
use warnings;

# use Data::Dumper;

my $infile = $ARGV[0];
open(F, $infile);
my $go_terms;
while (<F>) {
	my (undef, $go_term, $val1, $val2) = split(/\s+/);
	$go_terms->{$go_term}->{'val1'} += $val1;
	$go_terms->{$go_term}->{'val2'} += $val2;
}

foreach my $go_term (sort keys %$go_terms) {
	print $go_term . "\t" . $go_terms->{$go_term}->{'val1'} . "\t" . $go_terms->{$go_term}->{'val2'} . "\n";
}
