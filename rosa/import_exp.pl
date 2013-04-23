#!/usr/bin/perl

use strict;
use warnings;
use Bio::SeqIO;
use DBI;

my ($exp_name, $datafile) = @ARGV;
my ($db, $host, $user, $pass) = ("robadirosa","localhost","root", "12345");
my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) or die "Can't connect to $db\n";

my $insert_sql = 'INSERT INTO refspositions VALUES(?, ?, ?, ?, ?, ?, ?, ?)';

open(D, $datafile);
my @errors;
my $line_n = 1;
while ( my $line = <D> ) {
	$line =~ s/\s+$//;
	my @values = split(/;/, $line);
	if ($#values != 6 ) {
		push(@errors, "Error in line  $line_n: '".$line."', it has less than 7 cols");
		next;
	}
	my ($name, $ref_position, $reference, $allele_variation, $frequencies, $counts, $coverage) = @values;
	eval {
		my $sth = $dbh->prepare($insert_sql);
		$sth->execute($exp_name, $name, $ref_position, $reference, $allele_variation, $frequencies, $counts, $coverage);
	};
       	push (@errors, "Error in line $line_n: '".$line."', ".$@) if $@;
	$line_n++;
}
close(D);
foreach my $error (@errors) {
	print "$error\n"
}

