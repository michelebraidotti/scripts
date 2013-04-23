#!/usr/bin/perl 
use strict;
use warnings;
use Data::Dumper;

my ($file_name, $scaff_name, $start, $end) = @ARGV;
open(F, $file_name);
my $scaffolds = [];
my $linec = 0;
while (my $line = <F>) {
	if ( $line =~ /$scaff_name\s+/ ) {
		my $scaffold_info = {};
		$scaffold_info->{'name'} = $scaff_name;
		my $pos=tell(F);
		my $count = 0;
		while ( my $numline = <F> ) {
			last if ( $numline =~ /[A-Za-z]/ );
			$numline =~ /(\d+)/;
			$count++;
			if ( $count >= $start && $count <= $end) {
				push (@{$scaffold_info->{'values'}}, $1);
			}
			last if ($count > $end);
		}
		seek(F,$pos,0);
		push (@$scaffolds, $scaffold_info);
		last;
	}
}
close(F);
# print Dumper($scaffolds);
for my $scaffold_info (@$scaffolds) {
	print $scaffold_info->{'name'}."\t";
	for my $vals (@{$scaffold_info->{'values'}}) {
		print $vals."\t";
	}
	print "\n";
}

