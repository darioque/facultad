#!/bin/bash
echo Bienvenido $(whoami)
echo ""

while true
do
	echo ---------Menu de Opciones-------------
	echo 1. Suma los dos numeros
	echo 2. Multiplicar 2 numeros
	echo 3. Generar archivo con frase repetida
	echo 4. Mostrar la memoria libre del sistema
	echo 5. Salir
	echo ""
	read -p "Ingrese la opción deseada: " opc
	
	case $opc in
		1)
			if test $# -eq 2
			then
				echo "El resultado de la suma es: " $(($1 + $2))
			else
				echo "No hay 2 parametros posicionales"		
			fi
	;;
		2)
			read -p "Ingrese el primer numero: " num1
			read -p "Ingrese el segundo numero: " num2
			echo El resultado de la multiplicación es: $(($num1 * $num2))
		
	;;
		3)
			read -p "Ingrese la frase a repetir: " frase
			read -p "Ingrese el nombre del archivo: " archivo
			touch $archivo
			for i in {1..5}
			do
				echo $frase >> $archivo
			done
	;;
		4)
			echo "La memoria libre es: " $(free -h | grep ^"Mem" | tr -s " " | cut -d " " -f2)
	;;
		*)
			break
	;;
	esac
read -p "presione una tecla..."
clear
done
echo hola