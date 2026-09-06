#!/bin/sh

ip_address=$(cat ~/.config/bspwm/bin/target | awk '{print $1}')
machine_name=$(cat ~/.config/bspwm/bin/target | awk '{print $2}')

if [ $ip_address ] && [ $machine_name ]; then
    echo "%{F#e51d0b}什%{F#ffffff} $ip_address | $machine_name%{u-}"
else
    echo "%{F#e51d0b}ﲅ %{u-}%{F#ffffff} No target"
fi
