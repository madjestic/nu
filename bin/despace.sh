#!/bin/sh

## Filename:      despace
## Description:		A small utility to replace spaces in a file-name with '_'
##                i.e. $ foo bar -> $ foo_bar
## Author: 		    Vladimir Lopatin
## Maintainer: 		Vladimir Lopatin
## Created: 		  Thu Dec 26 03:41:06 CET 2013
## Version: 	       	0.0.0.1
## Package-Requires:   	(mv)
## Last-Updated:       	Thu Dec 26 03:41:26 CET 
## By:	                Vladimir Lopatin
## URL: 
## Doc URL: 
## Keywords:            utility, rename files
## Compatibility:       all 
## 
######################################################################

## Commentary: 
## 
## Example:
##
## $ touch "foo bar"
## $ ./despace ./"foo bar"
## $ ls
## > foo_bar
## 
######################################################################

## Change Log:
## 
## v.0.1.0 : added commentary 
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

despace() {
    if [ -e "$1" ]
    then 
	str="$1"
	mv "$1" ${str// /_}
    fi
}

despace "$1"



######################################################################
