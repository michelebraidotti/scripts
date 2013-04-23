#Se ho due colonne

#Contig1	Contig1
#Contig3	Contig3
#Contig3	Contig24076
#Contig3	Contig177195
#Contig3	Contig2338
#Contig4	Contig4
#Contig4	Contig60154
#Contig4	Contig60154
#Contig4	Contig60154
#Contig4	Contig78182
#Contig4	Contig78182
#Contig4	Contig78182
#Contig4	Contig78182
#Contig4	Contig78182

#Questo script mi permette di sapere quanti risultati corrispondono ad ogni contig presente nella colonna 1 senza contare le ripetizioni.
#Per es. 
#il contig 1 ha 1 risultato, quindi come output avra' 1
#il contig 3 ha 4 risultati, quindi come output avra' 4
#il contig 4 ha 9 risultati, ma l'output sara' 3 dato che 3 risultati sono uguali tra loro e altri 5 sono uguali tra loro

#Uso:
#perl count_occurences.pl "file di input" > "file di output"

#!/usr/bin/perl

use strict;
use warnings;

my $infile = $ARGV[0];
my %ctgs;
open(F, $infile);
while (<F>) {
	my ($frst, $scnd) = split(/\s+/);
	$ctgs{$frst}{$scnd}++ if ($frst !~ /^\s*$/);
}
close(F);

foreach my $ctg (sort keys %ctgs) {
	my $count = (keys %{$ctgs{$ctg}});
	print $ctg."\t".$count."\n" if ($count >= 1);
}
