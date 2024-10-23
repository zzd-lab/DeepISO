use strict;
use warnings;
# ===========================================================
# Author: Xiaokun Guo
# Date: 2023-11-27
# Description: Each line in the queryss.txt file contains a .queryss 
#              file generated for a protein using Foldseek.
#              The output file isoform.foldseek.txt contains the structural 
#              characterization of each residue for each protein.
# ===========================================================

# open queryss.txt 
open my $P, '<', '/your/path/queryss.txt' or die "Cannot open file: $!";
my %gene;
while (my $first = <$P>) {
    chomp $first;
    my $name = (split /\//, $first)[7];
    open my $O, '<', $first or die "Cannot open file: $first";
    my $line = <$O>;
    chomp $line;
    $gene{$name} = $line;

    close $O;
}
close $P;

open my $W, '>', '/your/path/foldseek/output/isoform.foldseek.txt' or die "Cannot open output file: $!";
foreach (sort keys %gene) {
    print $W $_, "\t", $gene{$_}, "\n";
}
close $W;
