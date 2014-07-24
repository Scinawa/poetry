<?php



/*
Tentativo di fare a mano la matrice di coincidenza tra il sottoinsieme di p*q=33, di cardinalità 28.

*/
$b=array(	1=>array(1=>"i cuccioli ", 2=>"sono ", 3=>"a casa ", 4=>"dal Ventura "),
			2=>array(1=>"ch'io ", 2=>"non avrei creduto ", 3=>"che morte ", 4=>"tante ne avesse disfatti "),
			3=>array(1=>"la sua pazzia ", 2=>"inizia ", 3=>"nel momento in cui ", 4=>"piangxe sul cavallo "),
			4=>array(1=>"(io) ", 2=>"sono ", 3=>"il palcoscenico ", 4=>"su cui passano vari attori "),		
			5=>array(1=>"questo file ", 2=>"è stato contaminato ", 3=>"dal virus ", 4=>"più lento del mondo "),
			6=>array(1=>"a noi poveri ", 2=>"tocca ", 3=>"la nostra parte di ricchezza ", 4=>"l'odore dei limoni"),
			7=>array(1=>"e le mie parole e il mio amore ", 2=>"sarebbero ", 3=>"un arco ", 4=>"di trionfo "));

			
$c=array(array());

$c[1][1]=$b[1][1]; // 1
$c[1][2]=$b[7][2]; // 26
$c[1][3]=$b[2][4]; // 8
$c[1][4]=$b[4][3]; // 15

$c[2][1]=$b[4][1]; // 13
$c[2][2]=$b[7][3]; // 27
$c[2][3]=$b[7][1]; // 25
$c[2][4]=$b[1][2]; // 2

$c[3][1]=$b[4][2]; // 14 
$c[3][2]=$b[3][1]; // 9
$c[3][3]=$b[3][2]; // 10
$c[3][4]=$b[3][3]; // 11

$c[4][1]=$b[2][2]; // 6
$c[4][2]=$b[5][2]; // 18
$c[4][3]=$b[6][4]; // 24
$c[4][4]=$b[6][2]; // 22

$c[5][1]=$b[2][3]; // 7 
$c[5][2]=$b[2][1]; // 5
$c[5][3]=$b[3][4]; // 12
$c[5][4]=$b[6][3]; // 23

$c[6][1]=$b[5][3]; // 19
$c[6][2]=$b[5][4]; // 20
$c[6][3]=$b[6][1]; // 21
$c[6][4]=$b[4][4]; // 16

$c[7][1]=$b[7][4]; // 28
$c[7][2]=$b[1][4]; // 4
$c[7][3]=$b[1][3]; // 3
$c[7][4]=$b[5][1]; // 17

print_r($c);


	for ($i=1; $i<= 7; $i++)
	{
		for ($y=1; $y<=4; $y++)
		{
			echo $c[$i][$y];
		}
		echo "\n";
	}

?>