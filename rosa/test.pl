#!
open(MAP, "map.list") or die;
open(UNIQ, "uniq.list") or die;
while ($uniq = <UNIQ> ) {
$uniqs{$uniq}++;
}
while ($line = <MAP>){
       chomp ($line);
       ($a,$b,$c,$d,$e) = split(/\t/, $line);
       if(exists $uniqs{$d}){print "$line\n";}
               else{next;}                     }

