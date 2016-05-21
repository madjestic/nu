#!/bin/sh

## Filename:            hide
## Description:		A small utility for hiding and unhiding files
## Author: 		Vladimir Lopatin
## Maintainer: 		Vladimir Lopatin
## Created: 		Thu Dec 26 02:56:28 CET 2013
## Version: 	       	0.0.0.1
## Package-Requires:   	(mv)
## Last-Updated:       	Thu Dec 26 02:56:58 CET 2013
##	     By:	Vladimir Lopatin
##     Update #:	1
## URL: 
## Doc URL: 
## Keywords:            utility, hidden files
## Compatibility:       all 
## 
######################################################################

## Commentary: 
## 
## 
## 
######################################################################

## Change Log:
## 
## 
######################################################################
## 
## This program is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation; either version 3, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program; see the file COPYING.  If not, write to
## the Free Software Foundation, Inc., 51 Franklin Street, Fifth
## Floor, Boston, MA 02110-1301, USA.
## 
######################################################################

## Code:

hide() {
    if [ -z $2 ]
    then 
	mv "$1" ".$1"
    else
	if [ $1=="-u" ]
	then
	    string=$2
	    mv "$2" ${string:1}
	fi	
   fi
}

hide $1 $2



######################################################################
