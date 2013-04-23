#!/usr/bin/perl
#serve per estrarre dalla genbank NCBI le features date le sue coordinate
#comandi: perl extrac_features.pl "nome dello file dove e' presente la lista: contig|ID number|
#inizio sequenza|fine sequenza|.estensione del file" > "nome del file di output.estensione del file"


use strict;
use warnings;
use Data::Dumper;
use Bio::DB::GenBank;

my $gb = Bio::DB::GenBank->new();
my @entries;
open(F, $ARGV[0]);
while ( my $line = <F> ) {
	chomp($line);
	my @vals = split(/\s+/, $line);
	if ( $#vals != 3 ) {
		print "Error parsing line '$line'\n";
		next;
	}
	my ($id, $acc, $start, $end) = @vals;
	my $entry;
	$entry->{'id'} = $id;
	$entry->{'acc'} = $acc;
	$entry->{'start'} = $start;
	$entry->{'end'} = $end;
	push(@entries, $entry);
}
close(F);
foreach my $entry (@entries) {
	if ( ! defined($entry->{'acc'}) || $entry->{'acc'} eq "") {
		print "No accession found for ".$entry->{'id'}."\n";
	}
	else { 
		eval { 			
			my $seq_o = $gb->get_Seq_by_version($entry->{'acc'});
			foreach  my $feat ( $seq_o->get_all_SeqFeatures ) {
				my $start = $entry->{'start'};
				my $end = $entry->{'end'};
				my $is_included = 0;
				my $includes = 0;
				if ( ( $start <= $feat->start && $feat->start <= $end ) ||
				     ( $start <= $feat->end && $feat->end <= $end ) ){
					$includes = 1;
				}
				elsif ( ( $start >= $feat->start && $feat->start <= $end ) ||
				     ( $start <= $feat->end && $feat->end >= $end ) ){
					$is_included = 1;
				}
				else {
					$is_included = 0;
					$includes = 0;
				}
			       	if ( $includes || $is_included ) {
					print $entry->{'id'}."\t".$entry->{'acc'}."\t".$feat->primary_tag."\t";
					print $feat->start."\t".$feat->end."\t";
					if ( $includes ) {
						print "INCLUDES\t";
					}
					else {
						print "IS_INCLUDED\t";
					}
					foreach my $tag ( $feat->get_all_tags() ) {
						my $values =  join(", ", $feat->get_tag_values($tag));
						print "$tag = $values ";
					}
					print "\n";
				}
			}
		}; 
		print "Error while retrieving ".$entry->{'acc'}."\n" if $@;

	}
}
