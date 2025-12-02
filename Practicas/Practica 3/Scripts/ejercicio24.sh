#!/bin/bash
usuarios=( $(getent group users | cut -d: -f4 | tr ',' ' ') )
if [[ ${#usuarios[@]} -gt 0 ]]; 
then
	for nom in $usuarios;
	do
		echo "Usuario: $nom"
	done
else
	echo "No hay usuarios en el grupo"
fi

