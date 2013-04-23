#!/usr/bin/perl -w
#serve per estrarre da un file, dove sono presenti le sequenze in formato genebank, date le sue coordinate della sequenza
#comandi: extract_features_from_gbfile.pl "file lista: contig|ID number| inizio sequenza|fine sequenza|.estensione del file"
#"file dove sono presenti le sequenze in formato genebank" > "file di output"


use strict;
use warnings;
use Data::Dumper;
#use Bio::DB::GenPept;
#use Bio::DB::GenBank;
use Bio::SeqIO;
#use Bio::SeqIO::GenPept;


my $usage = "$0 entries_file gb_file\n";
my $entries_file = shift or die $usage;
my $gb_file = shift or die $usage;

my @entries;
open(F, $entries_file);
while ( my $line = <F> ) {
	chomp($line);
	my @vals = split(/\s+/, $line);
	if ( $#vals != 3 ) {
		print "Error parsing line '$line'\n";
		next;
	}
	my ($id, $version, $start, $end) = @vals;
	my $entry;
	$entry->{'id'} = $id;
	$entry->{'version'} = $version;
	$entry->{'start'} = $start;
	$entry->{'end'} = $end;
	push(@entries, $entry);
}
close(F);
my %gb_info;
my $inseq = Bio::SeqIO->new(
	-file   => $gb_file,
	-format => 'genbank' 
	#-format => 'genpept'
);
while (my $seq = $inseq->next_seq) {
	$gb_info{$seq->accession.'.'.$seq->seq_version} = $seq;
}
foreach my $entry (@entries) {
	if ( ! defined($entry->{'version'}) || $entry->{'version'} eq "") {
		print "No accession found for ".$entry->{'id'}."\n";
	}
	else { 
		eval { 			
			my $seq_o = $gb_info{$entry->{'version'}};
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
		print "Error while retrieving ".$entry->{'version'}."\n" if $@;

	}
}
