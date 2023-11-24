#!/bin/bash

echo "Автор: Лукашов Артем 
Программа: \"Временные метки файла\" 
 
    ОПИСАНИЕ 
  Данная программа построчно выводит: 
    - Время последнего доступа 
    - Время последнего изменения 
     - Время изменения индексного дескриптора
     "

while true; do
  echo "Введите название файл 
  > "
  read fileName
  if [ -f $fileName ]; then 
  #stat -L $fileName | grep -E "Access: 2"
    temp=$(stat -L $fileName | grep -E "Access: 2")
    echo "Время последнего доступа: ${temp#*:}" 
    
    temp=$(stat -L $fileName | grep -E "Modify:")
    echo "Время последнего изменения: ${temp#*:}"
     
    temp=$(stat -L $fileName | grep -E "Change:")
    echo "Время изменения индексного дескриптора: ${temp#*:}" 
  else 
    echo "
Данный файл не найден 
    "
    continue
  fi
  echo "
  Хотите продолжить? (y/n) 
  > "
  read answer
  if [ "$answer" != "y" ]; then 
    exit
  fi
done
