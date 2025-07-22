#!/bin/bash
# Simple command line dice roller
# using /dev/entropy via $RANDOM for randomness

# Usage:
# Invoke with one or an even number of arguments
# With one argument it rolls one die with that many sides
# With an even number of arguments it will take them in pairs and roll XdY accordingly

die(){
  result=$((1 + $RANDOM % $1))
  echo $result
  return $result
}

if [ $# -eq 0 ]
then
  echo "ERROR: Wrong number of arguments. Run this script with one or an even number of arguments!"
  exit 1
elif [ $# -eq 1 ]   # if one argument, just roll one die that big
then
  printf "Rolling 1d"$1"\n"
  printf "  Result: "$((1 + $RANDOM % $1 ))
  exit 0
elif [ $(($# % 2)) -eq 1 ]
then
  echo "ERROR: Wrong number of arguments. Run this script with one or an even number of arguments!"
  exit 1
fi

# if even number of arguments, process pairwise as XdY
for (( i=1; i<=$#; i=$(($i+2)) ))
do
	repeats=${!i}
	next=$(($i+1))
	size=${!next}
	printf "Rolling "$repeats"d"$size"\n"
	rolls=()
	for (( j=1; j<=$repeats; j++ ))
	do
		result=$(die $size)
		rolls+=($result)
	done
	printf "  Rolls: %s\n" "${rolls[*]}"
	
	total=0
	for k in ${rolls[@]}
	do
		total=$(($total+$k))
	done
	printf "  Total: "$total"\n"
done

exit 0
