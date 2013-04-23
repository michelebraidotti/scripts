#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my ($thresh, @files) = @ARGV;

my %res;
my @errors;
foreach my $datafile (@files) {
	warn "Processing $datafile ... \n";
	open(D, $datafile);
	my @errors;
	my $line_n = 1;
	while ( my $line = <D> ) {
		$line =~ s/\s+$//;
		$line =~ s/"//g;
		#se le colonne sono separate da tab allora usare questo comando
		#my @values = split(/\t/, $line);
		#se le colonne sono separate da ; allora usare questo comando
		my @values = split(/;/, $line);
		#se voglio separarle per qualunque successione di spazi uso:
		#my @values = split(/\s+/, $line);
		if ($#values != 6 ) {
			push(@errors, "Error in line  $line_n: '".$line."', it has less than 7 cols");
			next;
		}
		my ($name, $ref_position, $reference, $allele_variation, $frequencies, $counts, $coverage) = @values;
		unshift(@values, $datafile);
		push(@{ $res{$name}{$ref_position} }, \@values);
		$line_n++;
	}
	close(D);
}
foreach (@errors) { print "$_\n" }

# print Dumper(\%merges);
foreach my $name (sort keys %res) {
	foreach my $pos (sort { $a <=> $b } keys %{$res{$name}} ) {
		my $pos_arr = $res{$name}{$pos};
		my @res;
		if ( $#{$pos_arr} > 0 ) {
			my $print_out = 0;
			my $out = "$name\t$pos";
			foreach my $values (@{$pos_arr}) {
				my ($file_name, undef, undef, $reference, $allele_variation, $frequencies, $counts, $coverage) = @{$values};
				$print_out = 1 if ( $coverage > $thresh);
				$out .= "\t$file_name\t$reference\t$allele_variation\t$frequencies\t$counts\t$coverage";
			}
			$out .= "\n";
			print ($out) if ($print_out);
		}
	}
}
