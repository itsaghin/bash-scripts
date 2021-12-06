#!/usr/bin/bash

if [ -z $1 ]; then
    echo "Error: Input is required"
    exit 1
else
    scriptname=$1
fi

user=$(whoami)
echo "#!"$BASH > ./$scriptname.sh | chmod +x ./$scriptname.sh |code ./$scriptname.sh