#!/bin/bash
declare -a arreglo #Tengo que declararlo antes, el -a significa arreglo indexado
inicializar(){
	arreglo=()
	echo "Arreglo inicializado chabon"
}

agregar_elem(){
	if [[ $# -eq 0 ]];
	then
		echo "Tenes que pasar un parametro"
		return 1
	fi
	arreglo+=("$1")
	echo "Elemento agregado"
	return 0
}

eliminar_elem(){
	if [[ $# -eq 0 ]];
	then
		echo "Tenes que pasar un parametro"
		return 1
	fi
	if [[ $1 -lt 0 || $1 -gt "${#arreglo[@]}" ]];
	then
		echo "Posicion invalida"
		return 2
	fi
	unset arreglo[$1]
	arreglo=("${arreglo[@]}")  #Lo reindexo para no tener quilombos
	echo "Elemento eliminado"
}

longitud(){
	echo "Longitud del arreglo: ${#arreglo[@]}"
}

imprimir(){
	echo "Elementos: ${arreglo[@]}"
}

inicializar_Con_Valores(){
	if [[ $# -ne 2 ]];
	then
		echo "Tenes que pasar dos parametros"
		return 1
	fi
	arreglo=()
	for (( i=0; i<$1; i++ ));
	do
		arreglo+=("$2")
	done
}
opciones=( "Inicializar Arreglo" 
	"Agregar Elemento" 
	"Eliminar Elemento por Índice" 
	"Ver Longitud" 
	"Imprimir Arreglo" 
	"Inicializar con N Valores" 
	"Salir" )

select SELECCION in "${opciones[@]}";
do
	if [ "$SELECCION" == "Salir" ]; 
	then 
		exit 0
	elif [ -z "$SELECCION" ];
	then 
		echo "Opción inválida." 
	else 
		echo "--- Ejecutando ${SELECCION} ---" 
		case "$SELECCION" in 
		"Inicializar Arreglo") 
			inicializar 
			;; 
		"Agregar Elemento")
			echo -n "Ingrese valor: "
			read valor 
			agregar_elem "$valor" 
			;; 
		"Eliminar Elemento por Índice")
			echo -n "Ingrese índice: " 
			read indice 
			eliminar_elem "$indice" 
			;; 
		"Ver Longitud") 
			longitud 
			;; 
		"Imprimir Arreglo") 
			imprimir 
			;; 
		"Inicializar con N Valores") 
			echo -n "Ingrese cantidad: " 
			read cantidad 
			echo -n "Ingrese valor: " 
			read valor_rep 
			inicializar_Con_Valores "$cantidad" "$valor_rep" 
			;; 
		*) 
			echo "Opción desconocida." 
			;; 
		esac
	fi
done

