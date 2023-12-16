#!/usr/bin/env bash

#title:         generate_key.sh
#description:   Generate a key
#author:        Michael Muyakwa
#created:       2020-09-19
#updated:       N/A
#version:       1.0
#license:       MIT
#usage:         ./generate_key.sh
#==============================================================================

# Useless echo? Instead of 'echo $(cmd)', just use 'cmd'.
# Useless cat. Consider 'cmd < file | ..' or 'cmd file | ..' instead.
#echo "$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)"

# Nach shellshock wäre der befehl so besser. Muss ich jedoch noch testen.
tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 64 | head -n 1