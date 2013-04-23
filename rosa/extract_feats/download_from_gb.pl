#!/usr/bin/perl
#serve per scaricare le sequenze dalla genebank NCBI data una lista di accessioni (REFSEQ accession o accession.version)
#il formato di output e' il genebank, cambiando lo script posso scaricare in formato fasta
#comandi: download_from_gb.pl "file con la lista di accessioni" "file di output"


use strict;
use warnings;
use Data::Dumper;
use Bio::DB::GenBank;

my $usage = "$0 accessions_list_file out_file\n";
my $infile = shift or die $usage;
my $outfile = shift or die $usage;
my $gb = Bio::DB::GenBank->new();

open(F, $infile);
my $seq_out = Bio::SeqIO->new(
	-file => ">$outfile",
	-format => 'genbank'
#se voglio scaricare le sequenze in formato fasta al posto di genebank scrivo fasta

);
while ( my $line = <F> ) {
	chomp($line);
	print "Downloading $line ...";
	eval { 			
		my $seq_o = $gb->get_Seq_by_version($line);
		$seq_out->write_seq($seq_o);
		print "DONE\n";
	}; 
	print "\t Error while retrieving $line\n" if $@;
}
close(F);
