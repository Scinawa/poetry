#!/usr/bin/perl -w
use strict;



open ASD, "<chiavi";
open DSA, ">numerochiave";

foreach my $line (<ASD>){
	chomp $line;

	my $val1=0;
	my $val2=0;

	my @key=split(//, $line);
		foreach my $char (@key)
	{
	
	$val1=$val1+ord($char);
	#$val2=$val2+(ord($char)-96);
	}

	print "$line - $val1"."\n";
	

}
close(ASD);
