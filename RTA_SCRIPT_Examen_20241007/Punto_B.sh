#!/bin/bash

DISCO="/dev/sde"
echo "Parciono el disco: $DISCO"
echo

sudo fdisk $DISCO << EOF
n
p
1

+1G
n
p
2

+1G
n
p
3

+1G
n
e


n

+1G
n

+1G
n

+1G
n

+1g
n

+1G
n

+1G
n

+1G
n


p
w 
EOF
##Fin particion###
###Formateo discos utilizando ciclo###
for i in {1..11}; do sudo mkfs.ext4 /dev/sde$i; done 
##Listo Formateo###
###Monto###
echo "/dev/sde1 /Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 2" | sudo tee -a
echo "/dev/sde2 /Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 2" | sudo tee -a
echo "/dev/sde3 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 2" | sudo tee -a
echo "/dev/sde5 /Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 2" | sudo tee -a
echo "/dev/sde6 /Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 2" | sudo tee -a
echo "/dev/sde7 /Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 2" | sudo tee -a
echo "/dev/sde8 /Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 2" | sudo tee -a
echo "/dev/sde9 /Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 2" | sudo tee -a
echo "/dev/sde10 /Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 2" | sudo tee -a
echo "/dev/sde11 /Examenes-UTN/profesores ext4 defaults 0 2" | sudo tee -a

sudo mount -a

