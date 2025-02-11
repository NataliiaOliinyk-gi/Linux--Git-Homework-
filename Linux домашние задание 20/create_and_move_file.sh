#!/bin/bash

current_dir="/opt/281024-wdm/Nataliia_Oliinyk/DirHW20_1"
target_dir="/opt/281024-wdm/Nataliia_Oliinyk/DirHW20_2"


for i in {1..100}; do
        touch "$current_dir/$RANDOM"
done


for file in "$current_dir"/*; do
        filename=$(basename "$file")
        if (( filename % 2 == 0 )); then
                mv "$file" "$target_dir"
        fi
done

echo "Файлы перемещены"

echo "Директория $current_dir содержит файлы:"
ls -l $current_dir
echo "Директория $target_dir содержит файлы:"
ls -l $target_dir

