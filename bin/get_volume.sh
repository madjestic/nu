#!/bin/sh


# To generate bars in python:
# import numpy
# import math
# for i in numpy.arange(0, 10.1, 0.1):
#     print str(i) + ") bar='" + ''.join(['/' for s in range(0, int(round(i)))]) + ''.join(['-' for s in range(0, int(10 - round(i)))]) +"' ;;"
#
# (Requires minor hand-editing to remove '.0' for whole numbers.
#
#
bars=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2/10 }}' | head -n 1)

case $bars in
    0)   bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    0.1) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    0.2) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    0.3) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    0.4) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    0.5) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    0.6) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    0.7) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    0.8) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    0.9) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1)   bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1.1) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1.2) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1.3) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1.4) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1.5) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1.6) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1.7) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1.8) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    1.9) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    2)   bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    2.1) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    2.2) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    2.3) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    2.4) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    2.5) bar="<fc=#aaaaaa><icon=.icons/spkr_00.xbm/></fc>" ;;
    2.6) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    2.7) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    2.8) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    2.9) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3)   bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3.1) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3.2) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3.3) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3.4) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3.5) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3.6) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3.7) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3.8) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    3.9) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4)   bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4.1) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4.2) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4.3) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4.4) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4.5) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4.6) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4.7) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4.8) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    4.9) bar="<fc=#aaaaaa><icon=.icons/spkr_01.xbm/></fc>" ;;
    5)   bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    5.1) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    5.2) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    5.3) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    5.4) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    5.5) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    5.6) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    5.7) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    5.8) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    5.9) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6)   bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6.1) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6.2) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6.3) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6.4) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6.5) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6.6) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6.7) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6.8) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    6.9) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    7)   bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    7.1) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    7.2) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    7.3) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    7.4) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    7.5) bar="<fc=#aaaaaa><icon=.icons/spkr_02.xbm/></fc>" ;;
    7.6) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    7.7) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    7.8) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    7.9) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8)   bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8.1) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8.2) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8.3) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8.4) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8.5) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8.6) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8.7) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8.8) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    8.9) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9)   bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9.1) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9.2) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9.3) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9.4) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9.5) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9.6) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9.7) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9.8) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    9.9) bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    10)  bar="<fc=#aaaaaa><icon=.icons/spkr_03.xbm/></fc>" ;;
    *)   bar="<fc=red><icon=.icons/spkr_mm.xbm/></fc>" ;;
esac

echo "$bar"
