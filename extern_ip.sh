#!/bin/bash

#title:         extern_ip.sh
#description:   Show public IP
#author:        Michael Muyakwa
#created:       2018-01-04
#updated:       N/A
#version:       1.0
#license:       MIT
#usage:         ./extern_ip.sh
#==============================================================================

wget http://checkip.dyndns.org/ -q -O - |
grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>'
