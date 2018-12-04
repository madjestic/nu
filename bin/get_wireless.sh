#!/bin/sh

iwconfig wlan0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`iwconfig wlp4s0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`iwconfig wlp4s0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
bars=`expr $stngth / 10`

case $bars in
    0)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s00.xbm/></fc>" ;;
    1)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s00.xbm/></fc>" ;;
    2)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s01.xbm/></fc>" ;;
    3)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s01.xbm/></fc>" ;;
    4)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s02.xbm/></fc>" ;;
    5)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s02.xbm/></fc>" ;;
    6)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s03.xbm/></fc>" ;;
    7)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s03.xbm/></fc>" ;;
    8)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s04.xbm/></fc>" ;;
    9)  bar="<fc=#aaaaaa><icon=.icons/wifi_03_s04.xbm/></fc>" ;;
    10) bar="<fc=#aaaaaa><icon=.icons/wifi_03_s04.xbm/></fc>" ;;
    *)  bar="<fc=#aaaaaa><icon=.icons/wifi_no.xbm/></fc>"     ;;
esac

echo $essid $bar

exit 0
