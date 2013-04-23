#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my $list_file = $ARGV[0];
my $join_file = $ARGV[1];

my %list;
open(F, $list_file);
while (my $line = <F>) {
	$line =~ s/\s+$//;
	$line =~ s/^\s+//;
	$list{$line}++;	
}
close(F);
open(J, $join_file);
while (my $line = <J>) {
	my ($key, $val) = split(/\s+/, $line);
	$key =~ s/>//;
	if (exists $list{$key}) {
		print "$key\t$val\n";
	}
}
close(J);
