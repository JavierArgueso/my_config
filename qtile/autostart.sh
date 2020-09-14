#!/bin/sh
# Este script se ejecuta al incio de la sesion

# Establecer fondo de pantalla
nitrogen --restore

# Procesos en segundo plano
nm-applet &
blueman-applet &
pasystray &
xfce4-power-manager &
xscreenservice &

# Poner bonito compton
picom &
