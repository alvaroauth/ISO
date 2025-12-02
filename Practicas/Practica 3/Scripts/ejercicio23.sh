#!/bin/bash
v1=(10 15 20 25 30 35 40 45 50)
v2=(50 45 40 35 30 25 20 15 5)
for (( i=0; i<${#v1[@]}; i++ ));
do
	echo "La suma de la pos $i es: $(( v1[$i] + v2[$i] ))"
done
