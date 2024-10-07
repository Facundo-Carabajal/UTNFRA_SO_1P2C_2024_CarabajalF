#!/bin/bash

###Busco y filtro la primera linea de la memoria y lo redirecciono al FiltroBasico###
echo "$(head -n 1 /proc/meminfo)" > ~/repogit/UTNFRA_SO_1P2C_2024_CarabajalF/RTA_ARCHIVOS_Examen_20241007/Filtro_Basico.txt

##Agrego la informacion del fabricante del chasis, busco mediante grep y filtro las columnas, y lo redirecciono al archivo creado arriba##
echo "Fabricante del Chasis: $(sudo dmidecode -t chassis | grep 'Manufacturer:' | awk '{print $2, $3}')" >> ~/repogit/UTNFRA_SO_1P2C_2024_CarabajalF/RTA_ARCHIVOS_Examen_20241007/Filtro_Basico.txt
