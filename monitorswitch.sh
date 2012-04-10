#!/bin/bash

IN="LVDS1"
OUT="VGA1"

if (xrandr | grep "$OUT" | grep "+"); then
  #Monitor is connected and X is drawing to where it should be

  xrandr --output $OUT --off --output $IN --auto

  kill $(pidof tilda)
  
  #Switch out config file
  sleep 3 #Give tilda some time
  cp /home/patriotpie/.tilda/configs/laptoponly /home/patriotpie/.tilda/config_0

  exec tilda &

  nitrogen --restore

elif (xrandr | grep "$OUT" | grep " connected"); then
  #Monitor is connected but X is not drawing to it

  xrandr --output $IN --off
  xrandr --output $IN --mode 1366x768
  xrandr --output $OUT --mode 1920x1080 --pos 1366x0
  xrandr --output $IN --mode 1366x768 --pos 0x312

  kill $(pidof tilda)

  #switch config file to dualscreen
  sleep 3 #Give tilda time to rm .locks files
  cp /home/patriotpie/.tilda/configs/dualscreen /home/patriotpie/.tilda/config_0
  exec tilda &

  nitrogen --restore
fi
