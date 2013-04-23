#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Data::Dumper;

my @indiv_list = (@ARGV);
die "No individuals specified.\n" if ($#indiv_list < 0);
my ($host, $db, $user, $pass) = ('localhost', 'cazzetto', 'andrea', '12345');
#my ($host, $db, $user, $pass) = ('localhost', 'gbs_vitis_2', 'gbs', 'gbs');
my $dbh = DBI->connect("DBI:Pg:dbname=$db;host=$host", $user, $pass, {'RaiseError' => 1});

my $positions;
my $sequences;
my $indiv_comma_list = join(', ', @indiv_list);
$indiv_comma_list =~ s/, $//;
my $qry = "select distinct individual, position, chromosome, sequence from individual_sequence where individual in ($indiv_comma_list)";
my $sth = $dbh->prepare($qry);
$sth->execute();
while ( my $ref = $sth->fetchrow_hashref() ) {
        my $position = $ref->{'position'}."\t".$ref->{'chromosome'};
        my $sequence = $ref->{'sequence'};
        my $individual = $ref->{'individual'};
        $positions->{$position}++;
        $sequences->{$individual}->{$position} = $sequence;
}
$dbh->disconnect();
# PRINTING
for my $indiv (sort keys %$sequences) {
	print "$indiv\t";
}
print "\n";
foreach my $pos (sort keys %$positions) {
        next unless ( $positions->{$pos} > 1 );
        my $seqs;
        for my $indiv (@indiv_list) {
                if ( exists $sequences->{$indiv}->{$pos} ) {
                        $seqs->{$sequences->{$indiv}->{$pos}}++;
                }
        }
        my $n_of_seqs= keys %$seqs;
        if ( $n_of_seqs > 1 ) {
                # PRINT POSITION!
                print "$pos\t";
                for my $indiv (sort keys %$sequences) {
                        if ( exists $sequences->{$indiv}->{$pos} ) {
                                print $sequences->{$indiv}->{$pos}."\t"
                        }
                        else {
                                print "?\t";
                        }
                }
                print "\n";
        }
}


