#!/usr/bin/perl
use strict;
use warnings;
# tlucciano

my (@binArray);
#set rand num range 0 - 255
my $range = 256;
my $random_number = int(rand($range));
my ($k,$myAns,$ranNum,$rNum,$attempts,$now,$binNum,$num,$numArgs,$dec);
my (@ranNumList,@timeData);
my ($count)=0;

$numArgs=@ARGV;
if ($numArgs != 1){
   system("clear");
   print "Usage: binNew.pl BD|DB|2P\n";
   print "BD=binary to decimal | DB=decimal to binary | 2P=2 Powers\n";
   exit 1;
}elsif($ARGV[0] ne "BD" && $ARGV[0] ne "DB" && $ARGV[0] ne "2P"){
   system("clear");
   print "Usage: binNew.pl BD|DB\n";
   print "BD=binary to decimal | DB=decimal to binary\n";
   exit 1;
}else{
   system("clear");
   print "\nHow many attempts\n";
}


chomp ($attempts=<STDIN>);
# get 4 random numbers
for ($k=0;$k<$attempts;++$k)
{
   $ranNum=int(rand($range));
   push(@ranNumList,$ranNum);
   ++$count;
}
print "$count random numbers have been generated.\n";
print "Now test on the decimal equivalent: \n";
print "\n";

if ( $ARGV[0] eq "BD" )
{
    foreach $num (@ranNumList) {
         #print "num: $num ";
         printf ("%08b ",$num);
         printf ("in decimal: ");
         chomp ($myAns=<STDIN>);
         if ($myAns == $num){
            printf "Correct\n";
         }else{
           printf " InCorrect. Correct answer is $num\n";
         }
         #$dec = oct("0b$num");
         #print "$num converts to $dec\n";
    }
}elsif ($ARGV[0] eq "DB" )
{
   print "decimal to binary\n";
   foreach $num (@ranNumList) {
         #print "num: $num ";
         $binNum=unpack("B*", pack("N",$num));
         #printf ("binNum of %d is %08d\n",$num,$binNum);
         print "$num in binary (include leading 0): \n";
         chomp ($myAns=<STDIN>);
         $myAns="000000000000000000000000" . "$myAns";
         if ($myAns eq $binNum){
            printf "Correct\n";
         }else{
           $binNum=substr("$binNum",-8,8);
           printf " InCorrect. Correct answer is $binNum\n";
         }
   }
}elsif ($ARGV[0] eq "2P" )
{
   print "Compute 2 to the power of 0-15\n";
   my ($computeAns);
   my ($newrange);
   $count=0;
   $newrange=16;
   for ($k=0;$k<$attempts;++$k)
   {
     $computeAns=1;
     $count=0;
     $myAns=0;
     $ranNum=int(rand($newrange));
     print "2^$ranNum is: \n";
     chomp ($myAns=<STDIN>);
     while ($count < $ranNum){
        $computeAns=$computeAns * 2;
        ++$count;
     }

     if ($myAns == $computeAns){
         print "Correct\n";
     }else{
         print "InCorrect. Correct answer: $computeAns\n";
     }
   }
}else{
   print "BAD ARGUMENT. Use BD or DB\n";
}

END {
   warn "total script time: ", time - $^T, " seconds\n";
}
