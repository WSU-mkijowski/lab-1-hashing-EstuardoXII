#!/bin/bash

quiz_data="nonce-data.csv"
line_number=0
while IFS= read -r line; do 

    # skip the header
    if [[ $line_number -eq 0 ]]; then
        ((line_number++))
        continue
    fi

    # extract the username from the line
    username=$(printf $line | awk -F "," '{print $1}')
    # generate a 5 digit nonce
    nonce=$(printf "%05d" $((RANDOM % 100000)))

    nonce_username="$nonce""$username"

    hash=$(printf $nonce_username | sha256sum | awk '{print $1}')
    
    nonce_hash="$nonce""$hash"

    # i had to look up how to use sed to only replace once 
    # https://stackoverflow.com/questions/148451/how-to-use-sed-to-replace-only-the-first-occurrence-in-a-file
    sed -i "0,/$username/s//$nonce_hash/" nonce-data.csv
    
    ((line_number++))

done < "$quiz_data"