#!/usr/bin/perl 
#serve per estrarre diverse sequenze da un unico file fasta, per esempio una pseudomolecola, come quella di Oryza sativa. Questo script salva le sequenze estratte in file separati, e li mette nella cartella pieces
#comandi: entire_region.pl "file fasta da cui si estraggono le sequenze" "file lista costituito dal nome del segmento che estrarremo
#e le sue coordinate" Per es. solo14	3878109	3879790 


use strict;
use warnings;
use Bio::SeqIO;


my $fasta = $ARGV[0];
my $file_list = $ARGV[1];
my $out_dir = 'pieces/';
my $seqio_o = Bio::SeqIO->new(
	-file => $fasta,
	-format => 'fasta'
);
my $seq_o = $seqio_o->next_seq;
mkdir($out_dir);
open(F, $file_list);
while ( my $line = <F> ) {
	my ($name, $start, $end) = split(/\s+/, $line);
	next unless ( $name !~ /^\s*$/ && $start =~ /\d+/ && $end =~ /\d+/ );
	my $out_file = $out_dir.$name.'.fasta';
	my $tract = $seq_o->subseq($start, $end);
	open(O, ">$out_file");
	print O ">$name\n$tract\n";
	close(O);
}
close(F);
