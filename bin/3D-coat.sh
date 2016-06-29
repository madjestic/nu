#!/bin/sh

d_coat() {
    export FILE=$1
    if [ -e "$1" ]
    then
        cd ~/Projects/3D-CoatV4-5 && ./3d-coat-64 $FILE
    else
        cd ~/Projects/3D-CoatV4-5 && ./3d-coat-64
    fi

}

d_coat $1
