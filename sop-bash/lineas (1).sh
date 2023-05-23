#!/bin/bash
echo Bienvenido $(whoami)
echo ""

read -p "Ingrese la frase a escribir: " frase
if test $# -eq 2
then
	for i in $(seq 1 $1)
	do
		touch archivo$i
		for m in $(seq 1 $2)
		do
			echo $frase >> archivo$i
		done
	done
else
	echo "No se ingresaron 2 argumentos"
fi 