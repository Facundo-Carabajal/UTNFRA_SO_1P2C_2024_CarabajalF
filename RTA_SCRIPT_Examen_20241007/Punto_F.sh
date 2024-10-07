#!/bin/bash


### Creo variables con toda la info y los comandos ###
IP="Mi IP pública es: $(curl -s ifconfig.me)"

### Obtengo la URL del repositorio ###
URL="La URL de mi repositorio es: $(git -C ~/repogit/UTNFRA_SO_1P2C_2024_CarabajalF remote get-url origin)"
USUARIO="Mi usuario es: $(whoami)"
HASH="El hash de mi usuario es: $(echo -n "$USUARIO" | sha256sum | awk '{print $1}')"

### Redirecciono toda la información al archivo Filtro_Avanzado.txt ###
{
    echo "$IP"
    echo "$USUARIO"
    echo "$HASH"
    echo "$URL"
} > ~/repogit/UTNFRA_SO_1P2C_2024_CarabajalF/RTA_ARCHIVOS_Examen_20241007/Filtro_Avanzado.txt

