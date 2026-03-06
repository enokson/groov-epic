#!/bin/sh
### BEGIN INIT INFO
# Provides:          tailscaled
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start tailscaled at boot
# Description:       A simple script to start/stop tailscaled
### END INIT INFO

DAEMON="/usr/local/bin/tailscaled"
PIDFILE="/var/run/tailscaled.pid"

start() {
    echo "Starting tailscaled..."
    start-stop-daemon --start --background --make-pidfile --pidfile $PIDFILE --exec $DAEMON -- --statedir=/var/lib/tailscale
    echo "tailscaled started."
}

stop() {
    echo "Stopping tailscaled..."
    start-stop-daemon --stop --pidfile $PIDFILE
    rm -f $PIDFILE
    echo "tailscaled stopped."
}

restart() {
    stop
    sleep 1
    start
}

case "$1" in
    start) start ;;
    stop) stop ;;
    restart) restart ;;
    *) echo "Usage: $0 {start|stop|restart}" ;;
esac

exit 0
