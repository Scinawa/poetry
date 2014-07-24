#!/usr/bin/python
# -*- coding: iso-8859-15 -*-

def lcg(x, a, c, m):
    return ((a * x) + c) % m

input =    [["i cuccioli ", "sono ", "a casa ", "dal Ventura "],
            ["ch'io ", "non avrei creduto ", "che morte ", "tante ne avesse disfatti"],
            ["la sua pazzia ", "inizia ", "nel momento in cui ", "piange sul cavallo"],
            ["(io) ", "sono ", "il palcoscenico ", "su cui passano vari attori"],
            ["questo file ", "è stato contaminato ", "dal virus ", "più lento del mondo"],
            ["a noi poveri ", "tocca ", "la nostra parte di ricchezza ", "l'odore dei limoni"],
            ["e le mie parole e il mio amore ", "sarebbero ", "un arco ", "di trionfo"]]


c = 5 # TODO: derive from passphrase
x = 2 # TODO: derive from passphrase 

m = len(input)
n = len(input[0])

a = m + 1 # simplest way to derive a

output = [[None for column in row] for row in input]

for col in range(0, n):
    for row in range(0, m):
        output[x][col] = input[row][col]
        x = lcg(x, a, c, m)
    x = (x + c) % m

print '\n'.join([' '.join(row) for row in output])