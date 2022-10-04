#!/bin/bash

# Preguntamos el nombre del archivo y chequeamos que exista
read -p "Ingrese el nombre del archivo: " archivo
until test -r ./$archivo
do
	read -p "El archivo no existe, intente nuevamente: " archivo
done

# Creamos las variables a utilizar
totalIngresos=0
ingreso=0
mayores=0
usuario="No hubo ningun usuario que haya ingresado mas de 5 veces en el mes en curso"

# Iteramos sobre el archivo y obtenemos los datos necesarios
while read linea
do
	ingreso=$(echo $linea | cut -d "-" -f4)
	totalIngresos=$(($totalIngresos+$ingreso))
	if test $ingreso -gt 5
	then
		usuario="Hubo algun usuario que ingreso mas de 5 veces en el mes en curso"
	fi
	if test $(echo $linea | cut -d "-" -f3) = "si"
	then
		nacional=$(($nacional+1))
	fi
	if test $(echo $linea | cut -d "-" -f2) -gt 30
	then
		mayores=$(($mayores+1))
	fi
done < ./$archivo

# Mostramos los resultados por pantalla
echo "El total de ingresos es de" $totalIngresos
echo $usuario

if test $nacional -gt 4
then
	echo "Hay mayor porcentaje de usuarios nacionales"
else
	echo "Hay menor porcentaje de usuarios nacionales"
fi

echo "Hubo" $mayores "usuarios mayores de 30"