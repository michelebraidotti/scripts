#!/usr/bin/perl
#Dati un file di input e un file lista, estraggo dall'input tutte le righe che contengono quelle parole
#per es. data una lista di id estraggo dal file input tutte le linee che contengono quegli id

#Uso:
#perl greplist.pl lista.txt "file input"


use strict;
use warnings;

my $list_f = $ARGV[0];
my $search_f = $ARGV[1];

my $data;
open(S, $search_f);
while (my $line = <S>) {
	$line =~ s/^\s+//;
	$line =~ s/\s+$//;
	if ( $line !~ /^$/ ) {
		my @line = split(/\s+/, $line);
		push(@{$data->{$line[0]}}, \@line);
	}
}
close(S);

open(F, $list_f);
while (my $line = <F>) {
	$line =~ s/^\s+//;
	$line =~ s/\s+$//;
	if ( $line !~ /^$/ ) {
		if ( exists $data->{$line} ) {
			foreach my $search_line (@{ $data->{$line}}) {
				print join("\t", @$search_line);
				print "\n";
			}
		}
	}
}
close(F);
