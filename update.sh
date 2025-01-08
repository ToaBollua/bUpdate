#!/bin/bash

# ASCII banner
clear
echo -e "\033[1;32m"
cat << "EOF"
    __    __  __          __      __     
   / /_  / / / /___  ____/ /___ _/ /____ 
  / __ \/ / / / __ \/ __  / __ `/ __/ _ \
 / /_/ / /_/ / /_/ / /_/ / /_/ / /_/  __/
/_.___/\____/ .___/\__,_/\__,_/\__/\___/ 
           /_/                           

EOF

echo "Bienvenido al actualizador de sistema..."

# Preguntar al usuario si quiere actualizar cada sección
# Sientete libre de copiar el proceso para otros gestores de
# paquetes o sistemas similares que quieras actualizar
# de forma más cómoda con un solo comando!

echo -e "\033[1;32m"
read -p "¿Quieres actualizar los paquetes de Pacman? (S/n) " pacman_update

pacman_update="${pacman_update:-s}" 	# Esta linea settea la opción de update
					# a "S" para que el usuario no necesite
					# pulsar 's' explicitamente. Ahorrando
					# un poco de tiempo para el apresurado.

if [[ "$pacman_update" == "s" ]]; then
    sudo pacman -Scc
    sudo pacman -Syu
    echo "Paquetes de Pacman actualizados."
else
    echo "Paquetes de Pacman no actualizados."
fi

echo -e "\033[1;32m"
read -p "Quieres actualizar los paquetes de Yay? (S/n) " yay_update
yay_update="${yay_update:-s}"
if [[ "$yay_update" == "s" ]]; then
    yay -Scc
    yay -Syu
    echo "Paquetes de Yay actualizados."
else
    echo "Paquetes de Yay no actualizados."
fi

echo -e "\033[1;32m"
read -p "Quieres actualizar los paquetes de Flatpak? (S/n) " flatpak_update
flatpak_update="${flatpak_update:-s}"
if [[ "$flatpak_update" == "s" ]]; then
    flatpak update
    echo "Paquetes de Flatpak actualizados."
else
    echo "Paquetes de Flatpak no actualizados."
fi

echo -e "\033[1;32"
read -p "Quieres actualizar la base de datos de virus? (S/n) " virus_update
virus_update="${virus_update:-s}"
if [[ "$virus_update" == "s" ]]; then
    sudo freshclam
    echo "Base de datos de virus actualizada."
else
    echo "Base de datos de virus no actualizada."
fi

echo "====== Toda tu mierda se actualizó ======"

