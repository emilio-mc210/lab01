#!/bin/bash

#Cantidad de CPUs

echo "Cantidad de CPUs: $(nproc)"

#Memoria RAM disponible

echo "Memoria RAM: $(free -h | grep Mem | awk '{print $2}')"

#Espacio libre en disco

echo "Espacio disponible en el disco: $(df -h | grep ubuntu | awk '{print $4}')"

#Version del kernel de Linux

echo "Version del kernel de Linux: $(uname -r)"

#Tiepo de actividad del sistema

TIEMPO=$(uptime -p|awk '{print "",NF}')

if ((TIEMPO = 3)); then
	echo "El sistema lleva activo: $(uptime -p | awk '{print $2}') minutos"

else
	echo "El sistema lleva activo: $(uptime -p | awk '{print $2}') horas y $(uptime -p | awk '{print $4}') minutos"
fi

#Informacion sobre el sistema operativo

echo "Informacion del sistema operativo: $(lsb_release -d | grep Ubuntu | awk '{print $2","$3","$4}')"

#Nombre del host del sistema

echo "El nombre del host del sistema es: $(hostname)"

#Uso de la memoria swap

echo "Uso de memoria swap: $(free -h | grep Swap | awk '{print $3}')"

