#!/bin/sh

# export PS1="(houdini optirun) > "

houdini() {
		# cd /opt/hfs15.0.277/ && source ./houdini_setup && houdini
		export EDITOR=/usr/bin/emacs
		export force_s3tc_enable=true
		export HOUDINI_MMB_PAN=0
		export HOUDINI_NODE_WIDTH=2
		export HOUDINI=~/houdini_dir
		export HOUDINI_MAX_FILE_HISTORY=80
		export HOUDINI_OTLSCAN_PATH=$HOUDINI/houdini/otls:~/Projects/Houdini/otls
    export HOUDINI_DSO_ERROR=2
    export HOUDINI_USE_HFS_PYTHON=1
		export FILE=$1
		if [ -e "$1" ]
		then
				cd ~/houdini_dir && source ./houdini_setup && /home/madjestic/houdini_dir/bin/houdini $FILE
		else
				cd ~/houdini_dir && source ./houdini_setup && /home/madjestic/houdini_dir/bin/houdini
		fi
}

houdini $1
