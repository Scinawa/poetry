#!/usr/bin/perl -w
use strict;


open ASD, "<numericsort.output.te";
open DSA, "<output.te";



my @c;
my $ord=0;

# per ogni riga del file ordinato 
foreach my $line (<ASD>)
{
	chomp($line);
	
	# cerco nel file non ordinato in che 
	open DSA, "<output.te";
	my $cipher=1;
	foreach my $linez (<DSA>)
	{
		chomp($linez);
		if($linez==$line)
		{
			print "$line [$ord] è uguale a $linez in posizione [$cipher]\n";
			$c[$ord]=$cipher;
		}
		$cipher++;
	}
	close(DSA);
	$ord++;
}

open XXX, ">newpoem.txt";
my $count=1;
foreach my $coso (@c)
{
print XXX $coso."\n";
$count++;
}
