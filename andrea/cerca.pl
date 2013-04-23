#!/usr/bin/perl

use strict;
use warnings;

my $map_file = $ARGV[0];
my $uniq_file = $ARGV[1];
open(M, $map_file);
my %maps;
while (<M>) {
	my (undef, undef, undef, $key) = split(/\t/);
	$maps{$key} = $_;
}
close(M);
open(U, $uniq_file);
while(my $u = <U>) {
	$u =~ s/^\s*//;
	$u =~ s/\s*$//;
	print $maps{$u} if ( exists $maps{$u} );
}
close(U);
