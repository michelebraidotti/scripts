#!/usr/bin/perl

#perl cambionome.pl <file_con_i_nomi> <file_fasta>
#il file_con_i_nomi deve essere tipo:
#contig_33809 #U
#contig_76259 #U
#contig_65850 #U
#contig_61574 #U

#e l'output e' il file fasta + ".out"


use strict;
use warnings;
use Bio::SeqIO;
use Data::Dumper;

my ($names_f, $fasta_f) = @ARGV;
my $fasta_in  = Bio::SeqIO->new(-file => $fasta_f , -format => 'Fasta');
my $fasta_out = Bio::SeqIO->new(-file => ">".$fasta_f.".out" , -format => 'Fasta');

open(N, $names_f);
my %suffix;
while ( my $line = <N> ) {
	my ($name, $suff) = split(/\s+/, $line);
	$suffix{$name} = $suff if ( $name !~ /^\s*$/ );
}
close(N);

my %seqs;
while ( my $seq = $fasta_in->next_seq() ) {
	$seqs{$seq->id()} = $seq->seq();
}
foreach my $seq_id (sort keys %seqs) {
	foreach my $name (sort keys %suffix) {
		if ( $seq_id =~ /^$name$/ ) {
			my $seq = Bio::Seq->new( 
				-seq => $seqs{$seq_id},
		                -id  => $seq_id.$suffix{$name});
			$fasta_out->write_seq($seq);
		}
	}
}
