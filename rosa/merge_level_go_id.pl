#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

my $infile = $ARGV[0];
open(F, $infile);
my $lev_go_id;
while (my $line = <F>) {
	$line =~ s/\s+$//;
	$line =~ s/\t+/\t/g;
	my @elems =  split(/\t+/, $line);
	foreach (@elems) { s/\s+$//; s/^\s+//; };
	my ($inc_level, $inc_goid, $inc_term, $inc, $dec_level, $dec_goid, $dec_term, $dec, $tra_level, $tra_goid, $tra_term, $tra) = @elems;
	# print "$inc_level, $inc_goid, $inc_term, $inc, $dec_leve, $dec_goid, $dec_term, $dec, $tra_level, $tra_goid, $tra_term, $tra\n"
	$lev_go_id->{$inc_level}->{$inc_goid}->{$inc_term}->{'increase'} = $inc if (defined $inc);
	$lev_go_id->{$dec_level}->{$dec_goid}->{$dec_term}->{'decrease'} = $dec if (defined $dec);
	$lev_go_id->{$tra_level}->{$tra_goid}->{$tra_term}->{'transient'} = $tra if (defined $tra);
}
close(F);
# print Dumper($lev_go_id);
print "Level\tGO ID\tTerm\t#increasing\t#decreasing\t#transient\n";
foreach my $level (sort keys %$lev_go_id) {
	foreach my $goid (sort keys %{$lev_go_id->{$level}}) {
		foreach my $term (sort keys %{$lev_go_id->{$level}->{$goid}}) {
			my $outstr = "$level\t$goid\t$term\t";
			if (exists $lev_go_id->{$level}->{$goid}->{$term}->{'increase'}) {
				$outstr .=  "\t".$lev_go_id->{$level}->{$goid}->{$term}->{'increase'};
			}
			else { $outstr .= "\t0" }
			if (exists $lev_go_id->{$level}->{$goid}->{$term}->{'decrease'}) {
				$outstr .=  "\t".$lev_go_id->{$level}->{$goid}->{$term}->{'decrease'};
			}
			else { $outstr .= "\t0" }
			if (exists $lev_go_id->{$level}->{$goid}->{$term}->{'transient'}) {
				$outstr .=  "\t".$lev_go_id->{$level}->{$goid}->{$term}->{'transient'};
			}
			else { $outstr .= "\t0" }
			print $outstr."\n";
		}
	}
}

