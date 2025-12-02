#!/bin/bash
arreglo=(10 3 4 12 15 43 9 8 7)
imp=()
procesarArreglo(){
	for n in ${arreglo[@]};
	do
		if [[ $(( n % 2 )) -eq 0 ]];
		then
			echo "$n"
		else
			imp+=("$n");
		fi
	done
}
procesarArreglo
echo "${imp[@]}"
