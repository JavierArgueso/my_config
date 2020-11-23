#/bin/sh

echo "\n#####################################################################"
echo "Actualizando repositorios"
echo "#####################################################################\n"
sudo apt update

echo "\n#####################################################################"
echo "Actualizando paquetes"
echo "#####################################################################\n"
sudo apt upgrade -y

echo "\n#####################################################################"
echo "Actualizando paquetes flatpak"
echo "#####################################################################\n"
flatpak update -y

echo "\n#####################################################################"
echo "Actualizando paquetes snap"
echo "#####################################################################\n"
sudo snap refresh
