#!/bin/sh

## Filename:            mvlink
## Description:		      A small utility for renaming symlinks
## Author: 		          Vladimir Lopatin
## Maintainer: 		      Vladimir Lopatin
## Created: 		        Thu Dec 26 01:37:45 2013 (+0100)
## Version: 	       	  0.0.0.1
## Package-Requires:   	(ln)
## Last-Updated:       	Thu Dec 26 01:43:34 CET 2013
## By:	Vladimir Lopatin
## Keywords:            utility, links, symlinks
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
## mvlink linkname target
mvlink() {
    if [ -e "$2" ]
    then 
	rm -R $1
	ln -s $2 $1
    else 
	ln -s $2 $1
    fi
}

mvlink $1 $2



######################################################################
