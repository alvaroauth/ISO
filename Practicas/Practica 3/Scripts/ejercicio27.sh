#!/bin/bash
if [[ $# -ne 1 ]];
then
	echo "Tenes que pasar un parametro"
	exit 1
fi
if [[ !(-d "$1") ]];
then
	echo "El parametro no es un directorio"
	exit 4
fi
cant=0
for ar in "$1"/*; 
do
	if [[ -f "$ar" && -r "$ar" && -w "$ar" ]];
	then
		let cant++
	fi
done
echo "La cantidad de archivos con permisos de lectura y escritura es: $cant"

