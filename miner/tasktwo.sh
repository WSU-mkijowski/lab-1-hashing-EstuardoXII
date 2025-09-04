#!/bin/bash

dictionary="../data/dictionary"
coins_file="../coins.txt"
required_zeros="000"

while IFS= read -r word; do
  for ((i=0; i<=9999; i++)); do
    # make nonces 4 digits
    salt=$(printf "%04d" "$i")

    # combine salt and word
    salted_coin="$salt""$word"

    # perform a sha256sum on salt+word
    hash_coin=$(printf "%s" $salted_coin | sha256sum | awk '{print $1}')

    # check if the hash of the potential coin starts with the required zeros, if yes append to coins.txt
    if [[ $hash_coin == ${required_zeros}* ]]; then
      printf "%s\n" "$salted_coin" >> "$coins_file"
    fi

  done
done < "$dictionary"