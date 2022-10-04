#!/bin/bash
echo bienvenido $(whoami)
rm historial
touch historial
while true
do
	echo a- mostrar cantidad de archivos
	echo b- cambiar permisos
	echo c- ver historial
	echo d- salir
	read -p "escoja una opcion: " opc
	echo usuario: $LOGNAME opcion: $opc fecha: $(date) >> historial
	case $opc in
		a)
			read -p "ingrese una ubicacion a buscar: " ubicacion
			until test -d $ubicacion 
			do
				read -p "ingrese una ubicacion a buscar: " ubicacion
			done
			cant=$(find $ubicacion | grep ^"-" | wc -l)
			echo "la cantidad de archivos es $cant" 
		;;
		b)
			read -p "ingrese el nombre del archivo: " archivo
			read -p "ingrese los nuevos permisos: " permisos
			chmod $permisos $ubicacion/$archivo 
			ls -l $ubicacion | cut -d " " -f1
		;;
		c)
			cat historial
		;;
		d)
			exit
		;;
		esac
echo ""
read -p "presione una tecla para continuar"
clear
done


