#!/bin/bash

echo "%{F#2495e7} %{F#ffffff}$(/usr/bin/ifconfig wlo1 | grep "inet " | awk '{print $2}')%{u-}"
