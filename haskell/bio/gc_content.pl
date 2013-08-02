#!/usr/bin/perl
use strict;
use warnings;

my $seq = $ARGV[0];
my $gc_count = 0;
my $total = 0;
foreach my $nucl (split('', $seq)) {
	$gc_count++ if ( $nucl eq 'c' || $nucl eq 'g' );
	$total++;
} 
printf ("%.2f\n", ($gc_count/$total)*100);
