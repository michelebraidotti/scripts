#!/usr/bin/perl
#serve per estrarre diverse sequenze da un unico file multi fasta, per esempio una pseudomolecola, come quella di Oryza sativa. Questo script scrive le sequenze in output
#comandi: entire_region_multi.pl "file multifasta da cui si estraggono le sequenze" "file lista costituito dal nome del segmento che estrarremo e le sue coordinate" Per es. se il file contiene una riga come:
# scaffold_1_1    24896   31120
# lo script produrra una sequenza con nome:
# >scaffold_1_1_24896_31120


use strict;
use warnings;
use Bio::SeqIO;


my $multi_fasta = $ARGV[0];
my $file_list = $ARGV[1];

open(F, $file_list);
while ( my $line = <F> ) {
	my $seqio_i = Bio::SeqIO->new(
		-file => $multi_fasta,
		-format => 'fasta'
	);
	while (my $seq_i = $seqio_i->next_seq) {
		my ($name, $start, $end) = split(/\s+/, $line);
		next unless ( $name !~ /^\s*$/ && $start =~ /\d+/ && $end =~ /\d+/ );
		if ( $seq_i->id() =~ /$name/ ) {
			my $tract = $seq_i->subseq($start, $end);
			$tract =~ s/(\w{60})/$1\n/g;
			print ">$name"."_".$start."_"."$end\n$tract\n";
		}
	}
}
close(F);
