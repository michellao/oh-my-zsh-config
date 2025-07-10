if [ -f /etc/hostname ]; then
    if [[ "$(cat /etc/hostname)" == "nanashi-hvywxx9" ]] && [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway > /tmp/sway.log
    elif [[ "$(cat /etc/hostname)" == "nanashi-desktop" ]] && [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
    fi
fi
