#!/usr/bin/perl

use strict;
use warnings;

my $frst_file = $ARGV[0];
my $scnd_file = $ARGV[1];
open(F, $frst_file);
my %occurences;
while (my $line = <F>) {
	$line =~ s/^\s+//;
	$line =~ s/\s+$//;
	$occurences{$line}++;
}
close(F);
open(S, $scnd_file);
while(my $scnd_line = <S>) {
	$scnd_line =~ s/^\s*//;
	$scnd_line =~ s/\s*$//;
	if ( exists $occurences{$scnd_line} ) {
		print $scnd_line."\tPRESENT\n";
	}
	else {
		print $scnd_line."\tABSENT\n";
	}
}
close(S);
