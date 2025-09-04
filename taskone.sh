#!/bin/bash

# make an array of the usernames excluding the header, and removing duplicates
list=($(tail -n +2 data/quiz_data.csv | awk -F ',' '{ print $1 }' | sort -u))

for i in "${!list[@]}"; do
  # generate a 5 digit salt
  salt=$(printf "%05d" $((RANDOM % 100000)))

  # append the salt to the username and perform a sha256sum
  hash=$(printf "${salt}${list[$i]}" | sha256sum | awk '{print $1}')

  salt_hash="$salt""$hash"

  # replace the username with the salt + hash
  sed -i "s/${list[$i]}/$salt_hash/" salted_data.csv
done