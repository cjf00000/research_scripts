#!/bin/bash

# Usage: make_test_data <full data> <train> <test_observed> <test_heldout>

if [ $# -ne "5" ]
then
	echo "Usage: make_test_data <full data> <train> <test_observed> <test_heldout> <train proportion>"
	exit 0
fi

full_data=$1
train_data=$2
test_observed_data=$3
test_heldout_data=$4
proportion=$5
intermediate_data=${train_data}.temp
full_test_data=${train_data}.temp2
script_root=`dirname $0`/..

# First we shuffle the training data
echo "Shuffling"
python $script_root/python/shuffle_lines.py $full_data > $intermediate_data

# We make train and test set
ndocuments=`cat $intermediate_data | wc -l`

ntrain=`printf "%.0f" $(echo "$ndocuments * $proportion" | bc)`
ntest=`printf "%.0f" $(echo "$ndocuments - $ntrain" | bc)`

head -n $ntrain $intermediate_data > $train_data
tail -n $ntest $intermediate_data > $full_test_data

# Then we make observed and heldout datasets
echo "Splitting"
python $script_root/python/split_test_data.py ${full_test_data} $test_observed_data $test_heldout_data

# Clean up
rm $intermediate_data
rm $full_test_data
