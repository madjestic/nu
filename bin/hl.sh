#!/bin/sh

## Filename:            hl
## Description:		A small utility for creating hard links
## Author: 		Vladimir Lopatin
## Maintainer: 		Vladimir Lopatin
## Created: 		Thu Dec 26 01:37:45 2013 (+0100)
## Version: 	       	0.0.0.1
## Package-Requires:   	(ln)
## Last-Updated:       	Thu Dec 26 01:43:34 CET 2013
##	     By:	Vladimir Lopatin
##     Update #:	1
## URL: 
## Doc URL: 
## Keywords:            utility, links, hard links
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

hl() {
    if [ -e "$2" ]
    then 
	rm $2
	ln $1 $2
    else 
	ln $1 $2
    fi
}

hl $1 $2



######################################################################
