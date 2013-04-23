#!/usr/bin/perl

use Bio::DB::GenBank;
use Bio::DB::Query::GenBank;
use Bio::SeqIO;
use Getopt::Long;
use Pod::Usage;

my $man = '';
my $help = '';
my $input = '';
my $output = '';
my $outformat = 'fasta';

GetOptions('help|?' => \$help,
                        man => \$man,
                        'input=s' => \$input,
                        'output=s' => \$output,
                        'outformat=s' => \$outformat,
                        )
 or pod2usage(2);
pod2usage(1) if $help;
pod2usage(-verbose => 2) if $man;
pod2usage(1) unless ($input && $output);


my $out = Bio::SeqIO->new(-file => ">$output",
                       -format => "$outformat");
open (TOS,"$input");
while ($line=<TOS>){
	chomp ($line);
	$query = $line;
	
	$gb_obj = Bio::DB::GenBank->new;
	my $stream_obj = $gb_obj->get_Stream_by_query($query);
	while ($seq_obj = $stream_obj->next_seq) {
		$out->write_seq($seq_obj);
	}
}

__END__

=head1 NAME

extract_sequence_in_gb_mode.pl - Getting sequence by Ids

=head1 SYNOPSIS

extract_sequence_in_gb_mode.pl [options]

 Options:
   -help            brief help message
   -man             full documentation
   -input           input (id) list file
   -output          output file
   -outformat       output format

=head1 OPTIONS

=over 8

=item B<-help>

Print a brief help message and exits.

=item B<-man>

Prints the manual page and exits.

=item B<-input>

input id list file.

=item B<-output>

Output data to a file.

=item B<-outformat> (optional)

Output sequence format, default is fasta.
Format list: fasta, genbank, scf, pir, embl, raw, gcg, ace, bsml, swiss, phd.

=back

=head1 DESCRIPTION

B<extract_sequence_in_gb_mode> will ...

=head1 AUTHOR 

Jianwei Zhang @ Arizona Genomics Institute

=head1 EMAIL

jzhang@cals.arizona.edu

=head1 BUGS

none.

=head1 SEE ALSO 

n50Finder.pl

=head1 COPYRIGHT 

This program is free software. You may copy or redistribute it under the same terms as Perl itself.

=cut

