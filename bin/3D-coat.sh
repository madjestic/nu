#!/bin/sh

d_coat() {
    export FILE=$1
    if [ -e "$1" ]
    then
        cd ~/3D-CoatV4-7 && ./3d-coat-64 $FILE
    else
        cd ~/3D-CoatV4-7 && ./3d-coat-64
    fi

}

d_coat $1
