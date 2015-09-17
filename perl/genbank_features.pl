#!/usr/bin/perl

use strict;
use warnings;
use Bio::SeqIO;
 
my $gb_file = $ARGV[0];
my $seqio_object = Bio::SeqIO->new(-file => $gb_file);

while (my $seq_object = $seqio_object->next_seq) {
	print $seq_object->display_id."\t";
	for my $feat_object ($seq_object->get_SeqFeatures) {
   		if ($feat_object->primary_tag eq 'CDS') {
			eval {
				for my $val ($feat_object->get_tag_values('label')) {
					print "$val\t";
				}
			}
		}
	}
	print "\n";
}

