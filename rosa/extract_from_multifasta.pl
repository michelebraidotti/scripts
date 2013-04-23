#!/usr/bin/perl
#Le specifiche sono:
#extract_from_multifasta.pl <file multifasta> <lista di id>
#crea un file nella stessa dir del file multifasta con lo stesso nome, ma ci appende l'estensione '.new'
#esempio:
#extract_from_multifasta.pl /tmp/mfasta /tmp/list
#creera' un file /tmp/mfasta.new con le sequence selezionate da lista.





use strict;
use warnings;
use Bio::SeqIO;

my $mfasta_file = $ARGV[0];
my $list = $ARGV[1];
my %ids;
open(L, $list);
while (my $line = <L>) {
	$line =~ s/\s+$//;
	$ids{$line}++;
}
close(L);
my $mfasta = Bio::SeqIO->new(
	-file => "<$mfasta_file",
	-format => 'fasta'
);
my $mfasta_out = Bio::SeqIO->new(
	-file => ">$mfasta_file.new",
	-format => 'fasta'
);

while (my $seq = $mfasta->next_seq) {
	if ( exists($ids{$seq->id}) ) {
		$mfasta_out->write_seq($seq);
	}
}

