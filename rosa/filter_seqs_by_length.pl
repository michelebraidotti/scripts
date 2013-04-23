#!/usr/bin/perl
#serve per estrarre da un multifasta le sequenze piu' lunghe di una data lunghezza
# comando da usare: filter_seqs_by_length.pl "file di imput" "file di output" "lunghezza minima da cercare"


use strict;
use warnings;
use Bio::SeqIO;


 
my $usage = "filter_seqs_by_length.pl infile outfile minlength\n";
#my $usage = "filter_seqs_by_length.pl infile outfile maxlength\n";
my $infile = shift or die $usage;
my $outfile = shift or die $usage;
my $minlength = shift or die $usage;
#my $maxlength = shift or die $usage;

my $seq_in = Bio::SeqIO->new(
	-file => "$infile",
	-format => 'fasta'
);
my $seq_out = Bio::SeqIO->new(
	-file => ">$outfile",
	-format => 'fasta'
);
while (my $inseq = $seq_in->next_seq) {
	$seq_out->write_seq($inseq) if ($inseq->length > $minlength);
	#$seq_out->write_seq($inseq) if ($inseq->length > $maxlength);
}
exit;

