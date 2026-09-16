#!/usr/bin/env bash
killall -q polybar
while pgrep -x polybar >/dev/null; do
    sleep 0.2
done

cfg="${HOME}/.config/bspwm/config/polybar/config.ini"

while IFS= read -r line; do
    mon="${line%%:*}"
    rest="${line#*: }"
    res="${rest%%+*}"          # e.g. 3840x2160 or 1920x1080
    w="${res%x*}"

    if [ "$w" -ge 3000 ]; then
        bar=z0rxh-bar          # 4K → dpi 120
    else
        bar=z0rxh-bar-fhd      # 1080p → dpi 96
    fi

    MONITOR="$mon" polybar -q "$bar" -c "$cfg" &
done < <(polybar --list-monitors)
