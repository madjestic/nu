#!/bin/sh

layman -S
eix-sync
haskell-updater
emerge -a --update --deep --with-bdeps=y world
read -p "press Enter to continue with depclean..."
emerge -av --depclean
read -p "press Enter to continue with revdep-rebuild pretend..."
revdep-rebuild -ip
read -p "press Enter to continue with revdep-rebuild..."
revdep-rebuild -i
# read -p "Finished updating Portage.  Press Enter to run Python Update"
# python-updater # was maasked around Nov 15 2017
