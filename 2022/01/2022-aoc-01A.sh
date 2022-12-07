#!/usr/bin/bash

filename="$@"

# variables
elfs=1
calories=0
maxcalories=0
maxelf=0

# Read the file
while IFS= read -r line; do
  # If blank line
  if [[ -z $line ]]; then
    if [ "$calories" -gt "$maxcalories" ]; then
      maxelf=$elfs
      maxcalories=$calories
    fi
    ((elfs++))
    calories=0
    continue
  fi
  calories=$(($calories + $line))
done < "$filename"

if [ "$calories" -gt "$maxcalories" ]; then
  maxelf=$elfs
  maxcalories=$calories
fi

echo "There are $elfs elves"
echo "The elf with more calories is the elf number $maxelf"
echo "The maximum amount of calories is $maxcalories"
