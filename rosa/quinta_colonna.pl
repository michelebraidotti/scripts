#!/usr/bin/perl

#perl quinta_colonna.pl quinta_colonna_test.txt


use strict;
use warnings;

my $infile = $ARGV[0];
open(F, $infile);
my $href;
while (my $line = <F>) {
	my ($num, $name);
	if ($line =~ /^\s/ ) { 
		(undef, $num, undef, undef, undef, $name) = split(/\s+/, $line);
	}	
	else {
		($num, undef, undef, undef, $name) = split(/\s+/, $line);
	}
	if ( $num !~ /^\s*$/ && $name !~ /^\s*$/ ) { 
		$href->{$name}->{$num} = $line; 
	}
}
close(F);
foreach my $name (sort keys %{$href}) {
	my @nums = reverse sort { $a <=> $b } keys %{$href->{$name}};
	print $href->{$name}->{$nums[0]};
}
