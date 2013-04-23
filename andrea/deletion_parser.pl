#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;

my $deletions_list;
open(D, $ARGV[1]);
while ( my $line= <D>) {
	chomp($line);
	my @vals = split(/\s+/, $line);
	$deletions_list->{$vals[0]} = $vals[1];
}
close(D);
# print Dumper($deletions_list);
open (D, $ARGV[0]);
while ( my $line= <D>) {
	chomp($line);
	my @vals = split(/\s+/, $line);
	my $deletion = "";
	$deletion = $deletions_list->{$vals[3]} if ( exists $deletions_list->{$vals[3]});
	print "$vals[0]\t$vals[1]\t$vals[2]\t$vals[3]\t$deletion\n";
}
