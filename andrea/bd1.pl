#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my ($infile) = @ARGV;
open(F, $infile);
my @intervals;
my $key = 'null';
while ( my $line = <F> ) {
	$line =~ s/\s+$//;
	my @elems = split(/\s+/, $line);
	if ($#elems == 1) {
		push(@intervals, {$key => $line});
	}
	elsif ( $#elems == 2 ) {
		$key = $line;
	}
	else {
		# we don't care
	}
}
# print Dumper \@intervals;
my $current_key = '';
my $count = 0;
my $out = '';
for my $interval (@intervals) {
	 my ($key, $val) = each($interval);
	 if ($key eq 'null') {
	 	$out .= "$val\n";
	 }
	 else {
	 	if ( $key ne $current_key ) {
			if ( $count > 0 ) {
				my $new_curr_key = $current_key."\t$count";
				$out =~ s/$current_key/$new_curr_key/;
			}
			$current_key = $key;
			$count = 0;
			$out .= "$key\n";
		}
		my (undef, $start, $end) = split(/\s+/, $key);
		my (undef, $pos) = split(/\s+/, $val);
		if ( $pos >= $start && $pos <= $end ) {
			$count++;
			$out .= "$val\t1\n";
		}
		else {
			$out .= "$val\n";
		}
	 }
}
if ( $count > 0 ) {
	my $new_curr_key = $current_key."\t$count";
	$out =~ s/$current_key/$new_curr_key/;
}
print "$out";

