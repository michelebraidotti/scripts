#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $infile = $ARGV[0];
my $max_results = $ARGV[1];
open(F, $infile);
my $entry;
my $res;
while (my $line = <F>) {
	my ($contig1, $contig2, $val) = split(/\s+/, $line);
	next unless ($contig1 && $contig2);
	next unless ($contig1 ne $contig2);
	if ( ! $res->{$contig1} ) {
		$res->{$contig1}->{$contig2} = $val;
	}
	else {
		insert_into_res($res, $contig1, $contig2, $val);
	}
}
# print Dumper($res);
foreach my $contig (sort keys %{$res}) {
	my $entries = $res->{$contig};
	my $i = 0;
	foreach my $entry ( sort { $entries->{$b} <=> $entries->{$a} } keys %{$entries} ) {
		if ( $i < $max_results ) { print "$contig\t$entry\n"; }
		$i++;
	}
}

sub insert_into_res {
	my ($res, $contig1, $contig2, $val) = @_;
	if ($res->{$contig1}->{$contig2}) {
		if ( $res->{$contig1}->{$contig2} < $val) {
			$res->{$contig1}->{$contig2} = $val;
		}
	}
	else {
		$res->{$contig1}->{$contig2} = $val;
	}
}

