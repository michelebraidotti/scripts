#!/usr/bin/perl 
use Bio::SeqIO;
use strict;
use warnings;

my $file = $ARGV[0];
my $len = $ARGV[1];
my $seqio_object = Bio::SeqIO->new(-file => $file);
while (my $seq = $seqio_object->next_seq) {
	$seq->seq =~ /([a-z]*)([A-Z]+)([a-z]+)([A-Z]+)([a-z]{$len})/;
	if (defined $5 || defined $4) {
		my $fourth = $4;
		my $all = $1.$2.$3.$4.$5; 
		if ( $fourth !~ /^A+$/ ) {
			if ( $fourth !~ /^T+$/ ) {
				print ">".$seq->id."\n".$all."\n";
			}
		}
	}
}
