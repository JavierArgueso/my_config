#!/bin/sh

# Instalando programas
echo "\nActualizando sistema"
sudo apt update && sudo apt upgrade -y

echo "\nInstalando repositorios"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -

echo "\nInstalando programas"
sudo apt install neovim zsh w3m-img imagemagick xdotool curl bspwm sxhkd rofi htop suckless-tools nodejs npm yarm

echo "\nDocker"
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG

# Coniguracion de git
echo "\nConfigurando git"
git config --global user.email "javierarguesosoto@gmail.com"
git config --global user.name "JavierArgueso"

# Widget Desktop
echo "\nDescargando e instalando el visor de escritorios"
git clone https://github.com/wsdfhjxc/virtual-desktop-bar.git
~/virtual-desktop-bar/scripts/install-dependencies-ubuntu.sh
~/virtual-desktop-bar/scripts/install-applet.sh

# Configuracion de las aplicaciones
echo "\nConfigurando nvim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "\nCopiando el inicio con Plasma y BSPWM en /usr/share/xsessions"
sudo cp ~/my_config/plasmaBSPWM.desktop /usr/share/xsessions/

echo "\nCreando carpeta y copiando conguracion de bspwm"
cp -r ~/my_config/bspwm/ ~/.config/bspwm/

echo "\nCreando carpeta y copiando configuracion de sxhkd"
cp -r ~/my_config/sxhkd/ ~/.config/sxhkd/

echo "\nGuardando los wallpapers"
cp -r ./wallpapers $HOME/.local/share/

echo "\nCreando carpeta y copiando dotFiles de nvim"
cp -r ~/my_config/nvim/ ~/.config/nvim/

echo "\nA continuación se van a instalar los plugins de nvim"
nvim +PlugInstall

echo "\nAhora es necesario que instale los componentes de Coc"
echo "coc-texlab"
echo "coc-python"
echo "coc-html"
echo "coc-css"
echo "coc-json"
echo "coc-tsserver"

nvim +"CocInstall coc-json coc-tsserver"

echo "\nFalta por instalar code y slimbook batery ademas de poner bonito"

echo "\nConfigurando zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
