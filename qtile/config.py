# Imports para que funcione la configuracion

import os
import subprocess
import socket
import platform

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, qtile, hook

from typing import List

# Mod4 = mod = tecla windows o super
mod = "mod4"
alt = 'mod1'
ctl = 'control'

keys = [
    
    # Super
    Key([mod], "Return", lazy.spawn("termite")),
    Key([mod], "f", lazy.spawn("firefox")),
    Key([mod], "e", lazy.spawn("thunar")),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "r", lazy.spawn('rofi -combi-modi window,drun,ssh -theme dmenu -font "hack 9" -show combi')),


    Key([mod], "space", lazy.next_layout()),
    Key([mod], "Tab", lazy.layout.next()),

    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -c 0 -q set Master toggle")),

    Key([mod], "o", lazy.spawn("oblogout")),
    Key([mod], "l", lazy.spawn("i3lock -i /home/javier/.config/my_config/wallpapers/dark-leaf-palm-wallpaper.jpg")),

    # Super + control
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

    # Alt
    Key([alt], "space", lazy.spawn('rofi -combi-modi window,drun,ssh -theme Pop-Dark -font "hack 10" -show combi -icon-theme "Tela-dark" -show-icons')),

]

# Colores
colors = [
    "#323642", # Panel
    "#05fcc6", # Detalle
    "#F1F2F3", # Principal
    "#7C818C", # Secundario
]

@hook.subscribe.startup_once
def autostartup():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

groups = [Group(i) for i in "1234"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
    ])

# Para usar monadTall con los siguientes comandos

    # super + h = izquierda (Con shift lo cambia)
    # super + l = derecha   (Con shift lo cambia)
    # super + j = abajo     (Con shift lo cambia)
    # super + k = arriba    (Con shift lo cambia)

layouts = [

    layout.MonadTall(
        border_focus = colors[1],
        margin=9,
        ),

    layout.Floating(
        border_focus = colors[1],
        ),

    layout.Max(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [

                # Escritorios virtuales
                widget.GroupBox(
                    font = 'DejaVu Sans Mono Book',
                    background = colors[0],
                    active = colors[2],
                    inactive = colors[3],
                    highlight_method = "block",
                    ), 

                # Prompt o ejecutardor de comandos en la barra
                widget.Prompt(
                    background = colors[0],
                    ),

                # Espaciador
                widget.Spacer(
                    background = colors[0]),

#                # Nivel de bateria
#                widget.Battery(
#                    format='{percent:2.0%}',
#                    background = colors[0],
#                    foreground = colors[3],
#                    ),

                # Bandeja de informacón del sistema
                widget.Systray(
                    background = colors[0],
                    ),

                # Reloj
                widget.Clock(
                    format='%H:%M',
                    background = colors[0],
                    ),
 
                # Layaout actual
                widget.CurrentLayoutIcon(
                    custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                    scale = 0.6,
                    background = colors[0],
                    ),
              
            ],
            24,
        ),
    ),
]

# Acciones con el raton
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'oblogout'},
    {'wmclass': 'qjackctl'},
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "LG3D"
