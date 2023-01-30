#!/usr/bin/bash

filename="$@"

# variables
elfs=1
calories=0
caloriesbkp=0
maxcalories=(0 0 0)
maxelf=0

# Read the file
while IFS= read -r line; do
  # If blank line
  if [[ -z $line ]]; then
    for i in "${!maxcalories[@]}"; do
      if [ "$calories" -gt "${maxcalories[$i]}" ]; then
        # maxelf=$elfs
        caloriesbkp=${maxcalories[$i]}
        maxcalories[$i]=$calories
        calories=$caloriesbkp
      fi
    done
    calories=0
    continue
  fi
  calories=$(($calories + $line))
done < "$filename"

for i in "${!maxcalories[@]}"; do
  if [ "$calories" -gt "${maxcalories[$i]}" ]; then
    # maxelf=$elfs
    caloriesbkp=${maxcalories[$i]}
    maxcalories[$i]=$calories
    calories=$caloriesbkp
  fi
done

for cal in "${maxcalories[@]}"; do
  let total+=$cal
done

echo "Total calories: ${total}"
