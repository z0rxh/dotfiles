# this file launch the bar/s

killall -q polybar

while pgrep -x polybar >/dev/null; do
    sleep 0.2
done

for mon in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$mon polybar -q z0rxh-bar -c "${HOME}"/.config/bspwm/config/polybar/config.ini &
done
