#!/usr/bin/perl
#Dati un file di input e un file lista, estraggo dall'input tutte le righe che non contengono quelle parole
#per es. data una lista di id estraggo dal file input tutte le linee che non contengono quegli id

#Uso:
#perl greplist_nomatch.pl lista.txt "file input"



use strict;
use warnings;

my $list_f = $ARGV[0];
my $search = $ARGV[1];

my $lines;
open(S, $search);
while (my $line = <S>) {
	$line =~ s/^\s+//;
	$line =~ s/\s+$//;
	$lines->{$line} = 0;
}
close(S);

open(F, $list_f);
while (my $pattern = <F>) {
	$pattern =~ s/^\s+//;
	$pattern =~ s/\s+$//;
	foreach  my $line ( keys %$lines ) {
		if ( $line =~ /^$pattern$/ ) {	
			$lines->{$line}++;
		}
	}
}
close(F);

foreach  my $line (sort keys %$lines ) {
	print $line."\n" if ($lines->{$line} == 0);
}
