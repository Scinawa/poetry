#!/usr/bin/perl -w
use strict;

open ASD, "<orderedpoetry.txt";

my @b=(	"(Tu) ", 			"(sei) predestinata ",	"a un orbita ", 	"di stella ", 
		"Stella ", 			"ti importa ", 			"di cosa ", 		"tutto il buio? ",
		"(tu) ", 			"vola ", 				"beata ", 			"in mezzo a questo tempo ",
		"la sua miseria ", 	"ti sia ", 				"estranea ", 		"ignota ",
		"la tua luce ", 	"è ", 					"del mondo ", 		"più remoto ",
		"pietà ",			"deve essere ", 		"per te ", 			"peccato ",
		"(tu) ", 			"hai ", 				"solo una legge: ", "essere pura ");

my @c;
my $count=0;

foreach my $val (<ASD>)
{	
	chomp($val);
	$c[$count]=$b[$val-1];
	$count++;
	
}


$count=1;
foreach my $val (@c)
{
print " $val ";
$count++;
if ($count==	4)
	{
	print "\n";
	$count=1;
	}
}
