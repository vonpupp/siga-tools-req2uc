#!/bin/bash

###############################################################################
#   Project:			SIGA-CCB
#   Component Name:		req2uc (CSV requirements to Sparx EA)
#   Language:			bash
#
#   License: 			GNU Public License
#	This file is part of req2ea.
#	Foobar is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	Foobar is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with Foobar.  If not, see <http://www.gnu.org/licenses/>. 
#
#   Author: 			Albert De La Fuente (www.albertdelafuente.com)
#   E-Mail: 			vonpupp@gmail.com
#
#   Description:		This script converts output file from
#	req2ea to Use Case import file.
#	Read the code, it's pretty much straight forward and self explainatory 
#
#   Limitations:		Error handling is not implemented, time constraints
#	The code is not clean and elegant as it should, again, time constraints
#   Database tables used:	None 
#   Thread Safe:		No
#   Extendable:			No
#   Platform Dependencies:	Linux (openSUSE used)
#   Compiler Options:		
#   Parameters:			$0 file-input file-output	
###############################################################################

# Result file
cp $1 $2
FIN=$1
FOUT=$2

# LC_ALL=en_US.utf8

# Trim whitespaces
#sed -i 's/^[ \t]*//' $FOUT
#sed -i 's/[ \t]*$//' $FOUT
#sed -i 's/^[ \t]*//;s/[ \t]*$//' $FOUT

# Remove the first line
sed -i '1,1d' $FOUT

#sed -i 's/Requirement/,/Requirement\n/g' $FOUT
sed -i 's/Requirement	"/Requirement\nDELTAG1/g' $FOUT
sed -i 's/^"\tMedium;/DELTAG2/g' $FOUT

# Delete the fourth column
#sed -i '/DELTAG1/,/^	Medium;/d' $FOUT
sed -i 's/^DELTAG1.*DELTAG2//g' $FOUT

echo "input: $FIN"
echo "output: $FOUT"
echo "NOTE: DID YOU REMOVE THE HEADERS & FOOTERS???"