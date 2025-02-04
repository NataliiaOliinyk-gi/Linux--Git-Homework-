#!/bin/bash
#
count=10
interval=5

for i in {1..10}
#for ((i=1; i <= count; i++));
do
        current_time=$(date '+%H:%M:%S')
        process_count=$(ps -ef | wc -l)
        echo "Время: $current_time  Количество процессов: $process_count"
        echo "Количество повторений: $count"
        echo "Повтор: $i"
#       sleep $interval

done

current_dir="/opt/281024-wdm/Nataliia_Oliinyk"
mkdir -p $current_dir/Dir_HW15

output_file="$current_dir/Dir_HW15/info.txt"
touch "$output_file"

lscpu > "$output_file"

cat /etc/os-release | grep NAME | grep -v _NAME >> "$output_file"
cat /etc/os-release | grep NAME | grep -v _NAME | sed 's/NAME="//' | sed 's/"//' >> "$output_file"



for i in {50..100}
do
        touch $current_dir/Dir_HW15/file_$i.txt
done