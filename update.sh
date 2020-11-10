#/bin/sh

echo "Actualizando repositorios\n"
sudo apt update

echo "\nActualizando paquetes\n"
sudo apt upgrade -y

echo "\nActualizando paquetes flatpak\n"
flatpak update
