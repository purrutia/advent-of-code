#!/usr/bin/bash

filename="$@"

# variables
elfs=1
calories=0
maxcalories=(0 0 0)
maxelf=0

# Read the file
while IFS= read -r line; do
  # If blank line
  if [[ -z $line ]]; then
    for i in ${!maxcalories[@]}; do
      if [ "$calories" -gt ${maxcalories[$i]} ]; then
        maxelf=$elfs
        maxcalories[$i]=$calories
        echo "maxcalories = ${maxcalories[@]}"
        break
      fi
    done
    ((elfs++))
    calories=0
    continue
  fi
  calories=$(($calories + $line))
done < "$filename"


for i in ${!maxcalories[@]}; do
  if [ "$calories" -gt "$maxcalories[$i]" ]; then
    maxelf=$elfs
    maxcalories[$i]=$calories
    break
  fi
done

echo "Total calories is $maxcalories[@]"
