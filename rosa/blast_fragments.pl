#!/usr/bin/perl
#comandi: blast_fragments.pl "la directory dove sono presenti le sequenze da blastare" "la directory dove e' presente il database"
#nella riga 26 bisogna scrivere l'estenzione del file da blastare (per esempio .fa o .5fa o .3fa)


#Le specifiche possono essere:
	#Queste specifiche sono state usate quando ho blastato O. eichingeri var africana contro la libreria di sequenze ripetute di riso. 
	#blastall -p blastn -e 1e-10 -F F -a 20 -q -4 -r 5 -i $dir/$fasta -b 1 -v 1 -d $dbname -o $dir/$fasta.bn

	#Nel caso debba fare blastx dove sia l'imput sia il database sono sequenze nucleotidiche (specifiche sempre usate quando ho blastato
	#O. eichingeri var africana contro la libreria di sequenze ripetute di riso):
	#blastall -p tblastx -e 1e-5 -F F -a 20 -i $dir/$fasta -b 1 -v 1 -d $dbname -o $dir/$fasta.bx

	#Nel caso debba blastare per es. le regioni fiancheggianti di un LTR uso:
	#blastall -p blastn -e 1e-100 -q -2 -r 3 -F F -a 20 -i $dir/$fasta -m 8 -b 10 -v 10 -d $dbname -o $dir/$fasta.bn


use strict;
use warnings;


my $dir = $ARGV[0];
my $dbname = $ARGV[1]; 

opendir(DIR, $dir) || die "can't opendir $dir: $!";
my @fastas = grep { /\.fasta$/ } readdir(DIR);
closedir DIR;
foreach my $fasta ( @fastas ){
	#my $cmd = "blastall -p tblastx -e 1e-5 -F F -a 20 -i $dir/$fasta -b 1 -v 1 -d $dbname -o $dir/$fasta.bx";
	my $cmd = "blastall -p blastn -e 1e-10 -F F -a 20 -q -4 -r 5 -i $dir/$fasta -b 1 -v 1 -d $dbname -o $dir/$fasta.bn";
	#my $cmd = "blastall -p blastn -e 1e-100 -q -2 -r 3 -F F -a 20 -i $dir/$fasta -m 8 -b 10 -v 10 -d $dbname -o $dir/$fasta.bn";

    system($cmd) == 0 || die "Error running $cmd";
}

