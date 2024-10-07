#!/bin/bash

### Cambio al home del usuario
cd ~

### Creo la estructura de directorios
mkdir -p Estructura_Asimetrica/{correo/{carta_{1..100},cartero_{1..10}},clientes/carta_{1..100}}

###Verifico con el comando dado
tree Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4

