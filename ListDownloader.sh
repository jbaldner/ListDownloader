#!/bin/bash

if [ -f "$1" ]; then

  while read p; do

    filename=$(basename $p)
    foldername="${filename%.*}"
    fullfilepath=./files/$foldername/$filename
    
    mkdir -p "./files/"

        if test -f "$fullfilepath"; then

            echo "File $filename is already downloaded skipping"

        else 

            mkdir -p "./files/$foldername/"
            wget "$p" 
            mv $filename "./files/$foldername/"

        fi

  done <$1

else 

    echo "$1 does not exist."
    
fi
