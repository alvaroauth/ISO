#!/bin/bash
num=(10 3 5 7 9 3 5 4)
productoria(){
	total=1
	for n in ${num[@]};
	do
		total=$(( total * n ))
	done
	echo "La multiplicacion de todos los numeros es: $total"
}
productoria
