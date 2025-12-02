#!/bin/bash
if [[ $# -eq 0 ]];
then
	echo "Tenes que pasar al menos un parametro"
	exit 1
fi
argu=($@)
for (( i=0; i<$#; i=i+2 ));
do
	if [[ -d "${argu[$i]}" ]];
	then
		echo "La ruta ${argu[$i]} existe y es una carpeta"
	elif [[ -f "${argu[$i]}" ]];
	then
		echo "La ruta ${argu[$i]} existe y es un archivo"
	else
		echo "No existe la ruta ${argu[$i]}"
	fi
done
