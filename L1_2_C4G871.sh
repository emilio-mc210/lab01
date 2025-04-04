#!/bin/bash

MAS_ERRORES=0
DIA_MAS=""

for doc in "logs"/*;do

	FECHA=$(echo "$doc" | awk -F '[_.]' '{print $2}')
	ERRORES=$(grep -c -F "[ERROR]" "$doc")
	WARNINGS=$(grep -c -F "[WARNING]" "$doc")

	#Imprimir datos en pantalla
	echo "Fecha: $FECHA"
	echo "Errores: $ERRORES"
	echo "Warnings: $WARNINGS"
	echo "--------------------"

	#Dia con mas errores
	if (($ERRORES > $MAS_ERRORES));then
		MAS_ERRORES=$ERRORES
		DIA_MAS=$FECHA
	fi
done

#Imprimir el dia con mas errores

echo "Dia con mas errores: $DIA_MAS"
