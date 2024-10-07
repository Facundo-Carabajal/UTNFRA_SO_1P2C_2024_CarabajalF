#!/bin/bash

##Creo los grupos
sudo groupadd -f p1c2_2024_gAlumno
sudo groupadd -f p1c2_2024_gProfesores

# Crear usuarios y asignar grupos
sudo useradd -m -s /bin/bash -c "p1c2_2024_A1" -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A1
sudo useradd -m -s /bin/bash -c "p1c2_2024_A2" -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A2
sudo useradd -m -s /bin/bash -c "p1c2_2024_A3" -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gAlumno p1c2_2024_A3
sudo useradd -m -s /bin/bash -c "p1c2_2024_P1" -p "$(sudo grep vagrant /etc/shadow | awk -F ':' '{print $2}')" -G p1c2_2024_gProfesores p1c2_2024_P1


# Valido que tengan la misma clave
sudo grep -E 'p1c2_2024_A1|p1c2_2024_A2|p1c2_2024_A3|p1c2_2024_P1' /etc/shadow |awk -F ':' '{print $2}'

##Permisos
#Cambio propietario y grupo
sudo chown p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chown p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chown p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chown p1c2_2024_P1:p1c2_2024_Profesores /Examenes-UTN/profesores



##Establezco permisos 
sudo chmod 750 /Examenes-UTN/alumno_1
sudo chmod 760 /Examenes-UTN/alumno_2
sudo chmod 700 /Examenes-UTN/alumno_3
sudo chmod 775 /Examenes-UTN/profesores


##Verifico
ls -l /Examenes-UTN



##Agrego el archivo de texto solicitado

# Crear el archivo en cada carpeta
echo

# Para alumno_1
echo "Creando validar.txt en /Examenes-UTN/alumno_1"
su - p1c2_2024_A1 -c 'echo $(whoami) > /Examenes-UTN/alumno_1/validar.txt'

# Para alumno_2
echo "Creando validar.txt en /Examenes-UTN/alumno_2"
su - p1c2_2024_A2 -c 'echo $(whoami) > /Examenes-UTN/alumno_2/validar.txt'

# Para alumno_3
echo "Creando validar.txt en /Examenes-UTN/alumno_3"
su - p1c2_2024_A3 -c 'echo $(whoami) > /Examenes-UTN/alumno_3/validar.txt'

# Para profesores
echo "Creando validar.txt en /Examenes-UTN/profesores"
su - p1c2_2024_P1 -c 'echo $(whoami) > /Examenes-UTN/profesores/validar.txt'

echo "Archivos validar.txt creados correctamente."

