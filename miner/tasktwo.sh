#!/bin/bash

dictionary="../data/dictionary"
coins_file="../coins.txt"
required_zeros="000000"

while IFS= read -r word; do
  for ((i=0; i<=999999; i++)); do
    # generate a 6 digit nonce
    salt=$(printf "%06d" "$i")

    # combine nonce and word
    nonce_coin="$nonce""$word"

    # perform a sha256sum on salt+word
    hash_coin=$(printf "%s" $nonce_coin | sha256sum | awk '{print $1}')

    # check if the hash of the potential coin starts with the required zeros, if yes append to coins.txt
    if [[ $hash_coin == ${required_zeros}* ]]; then
      printf "%s\n" "$nonce_coin" >> "$coins_file"
    fi

  done
done < "$dictionary"