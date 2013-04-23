#!/usr/bin/perl

#perl quinta_colonna.pl quinta_colonna_test.txt

use strict;
use warnings;

use Data::Dumper;

my $infile = $ARGV[0];
open(F, $infile);
my $href;
while (my $line = <F>) {
	my ($num, $name, $discriminator);
	if ($line =~ /^\s/ ) { 
		(undef, $num, undef, undef, undef, $name, undef, undef, undef, undef, undef, $discriminator) = split(/\s+/, $line);
	}	
	else {
		($num, undef, undef, undef, $name, undef, undef, undef, undef, undef, $discriminator) = split(/\s+/, $line);
	}
	if ( $num !~ /^\s*$/ && $name !~ /^\s*$/ ) { 
		$href->{$name}->{$num}->{$discriminator} = $line; 
	}
}
close(F);
foreach my $name (sort keys %{$href}) {
	my @nums = reverse sort { $a <=> $b } keys %{$href->{$name}};
	my $res = "";
	my @results;
	foreach my $num (@nums) {
		foreach my $discriminator (keys $href->{$name}->{$num}) {
			if ( $discriminator !~ /NH|U/) { 
				push (@results, $href->{$name}->{$num}->{$discriminator});
			}	
		}
	}
	if ( $#results != -1) { 
		$res = $results[0]; 
	}
	else { 
		(undef, $res) = each(%{$href->{$name}->{$nums[0]}}); 
	}
	print $res;
}
