#!/bin/bash
# calculate the mean average of wall clock time from multiple /usr/bin/time results.
# from
# http://stackoverflow.com/questions/8215482/mean-running-time-over-a-number-of-runs

file=${1}
cnt=0

if [ ${#file} -lt 1 ]; then
    echo "you must specify a file containing output of /usr/bin/time results"
    exit 1
elif [ ${#file} -gt 1 ]; then
    samples=(`grep --color=never  real ${file} | awk '{print $2}' | cut -dm -f2 | cut -ds -f1`)

    for sample in `grep --color=never real ${file} | awk '{print $2}' | cut -dm -f2 | cut -ds -f1`; do
        cnt=$(echo ${cnt}+${sample} | bc -l)
    done

    # Calculate the 'Mean' average (sum / samples).
    mean_avg=$(echo ${cnt}/${#samples[@]} | bc -l)
    mean_avg=$(echo ${mean_avg} | cut -b1-6)

    printf "\tSamples:\t%s \n\tMean Avg:\t%s\n\n" ${#samples[@]} ${mean_avg}
fi
