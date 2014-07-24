/*
Questo è una prova con vigernere, o una roba del genere :)

*/

#!/usr/bin/perl -w
use strict;

my $key="diocane";

my @key=split(/./, $key);
my $tapioco=0;


my @b;
$b[0]=("i cuccioli","ch'io","la sua pazzia","(io)","questo file","a noi poveri","e le mie parole e il mio amore");
$b[1]=("sono","non avrei creduto","inizia","sono","è stato contaminato","tocca","sarebbero");
$b[2]=("a casa","che morte","nell'istante in cui","il palcoscenico","dal virus","la nostra parte di ricchezza","un arco");
$b[3]=("dal Ventura","tante ne avesse disfatti","piange sul cavallo","su cui passano vari attori","più lento del mondo","l'odore dei limoni","un trionfo");

my  @c;


sub esplicati 
{
	for (my $i=0; $i<7; $i++)
	{
		for (my $y=0; $y<4; $y++)
		{
			print $c[$i][$y]."\n";
		}
	}
}

sub disagio2agio {
my ($chiave, $i, $y) = @_;
my $new=($y+$chiave)%7;
return $b[$i][$new];
}



for (my $i=0; $i<7; $i++)
{
	for (my $y=0; $y<4; $y++)
	{
	$c[$i][$y]=disagio2agio($tapioco%7, $i, $y);
	$tapioco++;
	}
}




