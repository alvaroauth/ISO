#!/bin/bash
arreglo=( $(find /home -type f -iname "*.doc"2>/dev/null) )

verArchivo(){
	if [[ $# -ne 1 ]];
	then
		echo "Pasa un parametro weon"
		return 1
	fi
	if [[ -f "$1" ]];
	then
		cat "$1"
	else
		echo "No es un archivo"
	fi
}

cantidadArchivos(){
	echo "${#arreglo[@]}"
}

borrarArchivo(){
	if [[ $# -ne 1 ]];
	then
		echo "Tenes que pasar un parametro"
		return 1
	fi
	buscado=$1
	pos=-1
	for i in "${!arreglo[@]}";
	do
		if [[ "${arreglo[$i]}" == $buscado ]];
		then
			pos=$i
			break
		fi
	done
	if [[ $pos -eq -1 ]]; 
	then
		echo "Elemento no encontrado"
		return 10;
	fi
	read -p "Desea eliminar fisicamente el archivo? (S/N)" op
	if [[ $op == "S" ]];
	then
		sudo rm "$1"
	fi
	unset arreglo[$pos]
	arreglo=( "${arreglo[@]}" )
	return 0
}

opciones=( "Contar archivos" "Ver contenido" "Borrar archivo" "Salir")
select opt in "${opciones[@]}"
do
	   case $opt in
	"Contar archivos")
	    cantidadArchivos
	    ;;
	"Ver contenido")
	    read -p "Ingrese la RUTA COMPLETA del archivo a ver: " ruta_a_ver
	    verArchivo "$ruta_a_ver"
	    ;;
	"Borrar archivo")
	    read -p "Ingrese la RUTA COMPLETA del archivo a borrar: " ruta_a_borrar
	    borrarArchivo "$ruta_a_borrar"
	    ;;
	"Salir")
	    break
	    ;;
	*)
	    echo "Opción inválida. $REPLY no es una opción del menú."
	    ;;
	esac
done


