use strict;
use warnings;

my $file = $ARGV[0];

open(F, $file);
my %markers;
my %varieties;
while (my $line = <F>) {
	my ($var, $mark) = split(/\s/, $line);
	$varieties{$var}{$mark} = 1;
	$markers{$mark} = 1;
}
print "\t";
for my $var (sort keys %varieties) {
	print $var."\t";
}
print "\n";
for my $mark (sort { $a <=> $b } keys %markers) {
	print "$mark\t";
	for my $var (sort keys %varieties) {
		if ( exists $varieties{$var}{$mark} ) {
			print "p\t";
		}
		else {
			print "a\t";
		}
	}
	print "\n";
}

