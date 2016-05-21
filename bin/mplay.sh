#!/bin/sh

# export PS1="(houdini optirun) > "

mplay() {
		# cd /opt/hfs15.0.277/ && source ./houdini_setup && houdini
		export EDITOR=/usr/bin/emacs
		export force_s3tc_enable=true
		export HOUDINI_MMB_PAN=0
		export HOUDINI_NODE_WIDTH=2
		export HOUDINI=~/houdini_dir
		export HOUDINI_OTLSCAN_PATH=$HOUDINI/houdini/otls:~/Projects/Houdini/otls
		export FILE=$(pwd)/$1
		if [ -e "$1" ]
		then
				cd ~/houdini_dir && source ./houdini_setup && /home/madjestic/houdini_dir/bin/mplay $FILE
		else
				cd ~/houdini_dir && source ./houdini_setup && /home/madjestic/houdini_dir/bin/mplay
		fi
}

mplay $1
