#!/usr/bin/perl -w
use warnings;
use bigint;
use strict;
use POSIX qw(floor);
use Math::Numbers;
use Math::Prime::TiedArray;
use Data::Dumper;

use Math::BigInt;
#use Math::BigInt qw/bmodpow/;


my @prime;
use constant MAX => 100;

my @darray;


sub factpq {
    my $innesco=0;
    my $n = $_[0];
    my ($p,$q);
    my $point=sqrt($n);
    $point=floor($point);
    my $expr=$point-$prime[$innesco];
    while ($expr>0)
        {
            $innesco++;
            $expr=$point-$prime[$innesco];
        }
    $innesco--;
    my $idp=$innesco;
    my $idq=$innesco;
    my $risultato;
    print"Choosen number is $n\n";
    print"The point where algo start is $point\n";
    do
    {
        $p=$prime[$idp];
        $idq=$innesco;
# Primo DO dove scende P
        do
        {
            my $q=$prime[$idq];            $risultato=($p*$q);
            if ($risultato == $n)
            {
                print "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
                print"Factorized results: P is: $p - Q is: $q \n";
                print "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
                return($p,$q);
            }
            $idq=++$idq;
        }
        while ($risultato<$n);
        $idp=--$idp;        #continuo a scendere
    }
    while ($risultato!=$n);
}




sub extendedeuclide {
    my ($a,$b)=@_;
    my $x=0;
    my $lastx=1;
    my $y=1;
    my $lasty=0;
    my ($temp,$quotient);

    while ($b!=0)
    {
        $temp=$b;
        $quotient=int($a/$b);
        $b=$a % $b;
        $a=$temp;
        $temp=$x;
        $x=$lastx-$quotient*$x;
        $lastx=$temp;
        $temp=$y;
        $y=$lasty-$quotient*$y;
        $lasty=$temp;
    }
    return ($lasty, $lastx);
}

sub computee
{

    my $totient=$_[0];
    my $co;
    my $log=int(log($totient));
    my $numbers=Math::Numbers->new($totient,$log);
    while (!$numbers->are_coprimes)
    {
        $co++;
        $log++;
        $numbers=Math::Numbers->new($totient,$log);
    }
    return($log);
}




sub createn
{
    my $q=$prime[rand(MAX)];
    my $p=$prime[rand(MAX)];
    my $n=$p*$q;
    return($n, $p, $q);
}

sub decfile
{
    my ($d,$n,$str);

    print"Where is the private.te? (privkey.te or brutedkey.te)";
    my $path=<STDIN>;
    if ($path eq '')
    {
        $path='privkey.te';
    }
    chomp($path);
    open PUB, "<$path" or die "I could not open $path: $!\n";
    $n=<PUB>;
    $d=<PUB>;
    chomp($n);
    chomp($d);
    close PUB;

    print"Where is the file to decrypt";
    $path=<STDIN>;
    if ($path eq '')
    {
        $path='encfile';
    }
    chomp($path);
    open ENC, "<$path" or die "I could not open $path: $!\n";
    my @m=<ENC>;
    close ENC;


    print"Where is the output file? (de-output.te)";
    $path=<STDIN>;
    if ($path eq '')
    {
        $path='';
    }
    chomp($path);
    open OUT, ">$path" or die "I cannot open $path: $!\n";
    print"ENNE $n  DI $d\n";
    foreach (@m)
    {
        chomp($_);
        my $X=Math::BigInt->new($_);
        $X->bmodpow($d,$n);
        print OUT "$X\n";
    }
    close OUT;
    exit;

}

sub encfile
{
    my ($e,$n,$str);

    print"Where is the pubkey.te? (pubkey.te)";
    my $path=<STDIN>;
    if ($path eq '')
    {
        $path='./pubkey.te';
    }
    chomp($path);
    open PUB, "<$path" or die "I could not open $path: $!\n";
    $n=<PUB>;
    $e=<PUB>;
    chomp($n);
    print"N $n\n";
    chomp($e);
    close PUB;

    print"Where is the file to encrypt";
    $path=<STDIN>;
    if ($path eq '')
    {
        $path='encfile';
    }
    chomp($path);
    open ENC, "<$path" or die "I could not open $path: $!\n";
    my @m=<ENC>;
    close ENC;

    print"Where is the output file? (output.te)";
    $path=<STDIN>;
    if ($path eq '')
    {
        $path='fuoriii';
    }
    chomp($path);
    open OUT, ">$path" or die "I cannot open $path: $!\n";
    foreach (@m)
    {
        chomp($_);
        my $X=Math::BigInt->new($_);
        $X->bmodpow($e,$n);
        print OUT "$X\n";
    }
    close OUT;
    exit;

}




sub brutez
  {
      print"Where is the pubkey.te? (default: pubkey.te)";
      my $path=<STDIN>;
      chomp($path);
      if ($path eq '')
      {
          $path="pubkey.te";
      }
      open ASD, "<$path";
      my $n=<ASD>;
      close ASD;
      chomp($n);
      my ($p,$q)=factpq($n);
      my $btotient=(($p-1)*($q-1));
     my $be=computee($btotient);
      my ($bd,$bk)=extendedeuclide($btotient,$be);
      open ASD, ">bruteinfo.te";
      print ASD "n is $n\nt is $btotient\np is $p\nq is $q\ne is $be\n+d is $bd\n";
      close ASD;
      open ASD, ">brutekey.te";
      print ASD "$n\n$bd\n";
      decfile;
      exit;
  }

sub gendarray
{
open DAR, "<numerochiave";
@darray=<DAR>;	
	close(DAR);
	foreach my $numerod (@darray)
	{
	chomp($numerod);
	}
}


sub checkdarray
{
	my $numerocheck = $_[0];
	foreach my $numerod (@darray)
	{
		if ($numerocheck==$numerod)
		{
		return 1;
		}
		print "x=$numerocheck, y=$numerod\n";
	}
return 0;
}


sub genkey
  {
  	gendarray();
  	  my ($privkey,$pubkey, $n, $p, $q, $d, $e, $k);
    
  	do {
     ($n,$p,$q)=createn;          
    #  print"p $p\n";
     # print"q $q\n";
      #print "N is $n\n";
      my $totient=(($p-1)*($q-1));
      #print"t is $totient\n";
      $e=computee($totient);
      #print"e is $e\n";
      ($d,$k)=extendedeuclide($totient,$e);
      #print"d is $d\n";
  	}
  	while (checkdarray($d)==0);

      open UNO,  "> privkey.te" or die "I could not open the file: $!\+n";      # salviamo le kiavi
      print UNO "$n\n$e\n";
      open DOS, "> pubkey.te" or die "I could not open the file $!\n";
      print DOS "$n\n$d\n";
      close UNO;
      close DOS;
      print"Keys saved in privkey.te, pubkey.te\n";

  }


tie @prime, "Math::Prime::TiedArray";
if (!defined $ARGV[0])
  {
      print"RSA Exposed\n";
      print"1 - Generate kay-pair\n";
      print"2 - Encrypt file\n";
      print"3 - Decrypt file\n";
      print"4 - Bruteforce a file with pubkey.te n\n";
      exit;
  }
my $cho=$ARGV[0];
chomp($cho);
if ($cho == 1)
{
    genkey;
}
if ($cho == 2)
{

    encfile;
}
if ($cho == 3)
{
    decfile;
}
if ($cho == 4)
{
brutez;
}
if ($cho == 5)
{
    exit;
}