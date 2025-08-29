#!/bin/sh

# Archivo donde guardas tus notas de HTB
NOTES="$HOME/Documents/htb_apps/htb_notes.txt"

# Crear archivo si no existe
[ -f "$NOTES" ] || echo "HTB Notes\nIP: 10.10.xx.xx\nUser: admin\nPass: SuperSecret" > "$NOTES"

# Lanzar el "botón" flotante
yad --undecorated \
    --skip-taskbar \
    --sticky \
    --geometry=80x80+50+50 \
    --no-buttons \
    --on-top \
    --title="HTB Sticky" \
    --borders=10 \
    --text="<span font='24' bgcolor='#2e3440' fgcolor='#88c0d0'><b>ᗢ</b></span>" \
    --text-align=center \
    --wrap &

# Mantener loop para abrir notas al hacer clic
while :; do
    yad --text-info --filename="$NOTES" \
        --width=420 --height=280 \
        --title="HTB Notes" \
        --borders=15 \
        --on-top \
        --button="Cerrar":1
done
