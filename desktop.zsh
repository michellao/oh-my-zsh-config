HOSTNAME_FILE=/etc/hostname
if [ -f $HOSTNAME_FILE ] && [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    if [ "$(cat $HOSTNAME_FILE)" = "nanashi-hvywxx9" ]; then
        exec sway > /tmp/sway.log
    elif [ "$(cat $HOSTNAME_FILE)" = "nanashi-desktop" ]; then
        exec /usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland
    fi
fi
