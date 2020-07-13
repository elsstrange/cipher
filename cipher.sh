#!/bin/bash

if [ "$2" == "enc" ]; then
    # For encrypting files, return a new file with the .enc extension
    destination_file="$3.enc"
elif [ "$2" == "dec" ]; then 
    # For decrypting files, return a new file with the .enc extension removed
    destination_file=${3:0:-4}
else
    echo "Unexpected argument. enc or dec must be specified."
    exit 1
fi

#echo $destination_file

./use_cipher.rb "$@" > "$destination_file"