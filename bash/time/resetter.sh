#!/bin/bash

#export LC_NUMERIC="en_US.UTF-8"

data_points=100
sc='scale=6'
nano=1000000000

for i in $(seq 1 $data_points); do
    measure_start=$(date +%s%N)
    measure_end=$(date +%s%N)
    measure_diff=$((measure_end - measure_start))
    ((measure_delay_total+=measure_diff))

    reset_start=$(date +%s%N)
    reset
    reset_end=$(date +%s%N)
    reset_diff=$((reset_end - reset_start))
    ((reset_total+=reset_diff))

    echo_reset_start=$(date +%s%N)
    echo -ne '\0033\0143'
    echo_reset_end=$(date +%s%N)
    echo_reset_diff=$((echo_reset_end - echo_reset_start))
    ((echo_reset_total+=echo_reset_diff))
done

measure_delay_avg=$(echo "$sc; $measure_delay_total / $data_points / $nano" | bc | \
    sed 's/^\./0./')
reset_avg=$(echo "$sc; $reset_total / $data_points / $nano" | bc | \
    sed 's/^\./0./')
echo_reset_avg=$(echo "$sc; $echo_reset_total / $data_points / $nano" | bc | \
    sed 's/^\./0./')

only_reset=$(echo "$reset_avg - $measure_delay_avg" | bc | sed 's/^\./0./')
only_echo_reset=$(echo "$echo_reset_avg - $measure_delay_avg" | bc | \
    sed 's/^\./0./')

echo -e "Measure delay:\t\t$measure_delay_avg"
echo
echo -e "Reset total:\t\t$reset_avg"
echo -e "Only reset:\t\t$only_reset"
echo
echo -e "Echo reset total:\t$echo_reset_avg"
echo -e "Only echo reset:\t$only_echo_reset"
echo
