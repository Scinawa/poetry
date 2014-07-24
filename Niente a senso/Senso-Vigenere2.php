<?php

$key="diocano";

$a_key=str_split($key);

$tapioco=0;



$a=array(0=>array(0=>"i cuccioli ", 1=>"ch'io ", 2=>"la sua pazzia ", 3=>"(io)", 4=>"questo file ", 5=>"a noi poveri ", 6=>"e le mie parole e il mio amore "), 
		 1=>array(0=>"sono ",1=>"non avrei creduto ",2=>"inizia ",3=>"sono ",4=>"è stato contaminato ",5=>"tocca",6=>"sarebbero "),
		 2=>array(0=>"a casa ",1=>"che morte ",2=>"nell'istante in cui ",3=>"il palcoscenico ",4=>"dal virus ",5=>"la nostra parte di ricchezza ",6=>"un arco "),
		 3=>array(0=>"dal Ventura ",1=>"tante ne avesse disfatti ",2=>"piange sul cavallo ",3=>"su cui passano vari attori ",4=>"più lento del mondo ",5=>"l'odore dei limoni ",6=>"un trionfo "));



$b=array();

function esplicati ()
{
	global $b;
	for ($i=0; $i<7; $i++)
	{
		for ($y=0; $y<4; $y++)
		{
			echo $b[$i][$y];
		}
		echo "\n";
	}
}

function disagio2agio ($char, $y, $x) {
	global $a;
	$new=($x + (ord($char)-96) )%7;
	//echo "$x + (" . (ord($char)-96) . ") mod 7 = " . $new."\n";
	return $a[$x][$new];
}



for ($y=0; $y<7; $y++)
{
	for ($x=0; $x<4; $x++)
	{
		$b[$y][$x]=disagio2agio($a_key[$tapioco%7], $y, $x);
		$tapioco++;
	}
	echo "\n";
}

esplicati();

?>




