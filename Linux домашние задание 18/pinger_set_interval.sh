#!/bin/bash
#

read -p "Введите адрес для пинга: " address
failed_count=0
echo "Начинаем пинг $address ..."

while true; do
ping_result=$(ping -c 1 $address 2>&1)

if [[ $? -ne 0 ]]; then
        ((failed_count++))
         echo "Ошибка пинга $address. Попытка $failed_count/3"
 else
         failed_count=0
         ping_time=$(echo "$ping_result" | grep 'time=' | awk -F 'time=' '{print $2}' | awk '{print $1}')
         echo "Пинг ${address}: ${ping_time} мс"

         if (( $(echo "$ping_time > 100" | bc -l) )); then
                 echo "Время пинга ${ping_time} мс превышает 100 мс"
         fi
fi

if [[ $failed_count -ge 3 ]]; then
        echo "Пинг ${address} не работает после 3 попыток."
        exit 1
fi

sleep 1

done