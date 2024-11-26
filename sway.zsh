if [ -f /etc/hostname ] && [[ "$(cat /etc/hostname)" == "nanashi-hvywxx9" ]] && [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec sway > /tmp/sway.log
fi
