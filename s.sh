#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Использование: $0 <папка1> <папка2>"
  exit 1
fi

DIR1="$1"
DIR2="$2"

# Поиск уникальных файлов в первой папке
echo "Уникальные файлы в $DIR1:"
UNIQUE_FILES_DIR1=$(comm -23 <(ls "$DIR1" | sort) <(ls "$DIR2" | sort))
if [ -z "$UNIQUE_FILES_DIR1" ]; then
  printf "\033[46mНет уникальных файлов\033[0m\n"
else
  echo "$UNIQUE_FILES_DIR1"
  printf "\033[41mКоличество уникальных файлов: $(echo "$UNIQUE_FILES_DIR1" | wc -l)\033[0m\n"
fi

# Поиск уникальных файлов во второй папке
echo "Уникальные файлы в $DIR2:"
UNIQUE_FILES_DIR2=$(comm -13 <(ls "$DIR1" | sort) <(ls "$DIR2" | sort))
if [ -z "$UNIQUE_FILES_DIR2" ]; then
  printf "\033[46mНет уникальных файлов\033[0m\n"
else
  echo "$UNIQUE_FILES_DIR2"
  printf "\033[41mКоличество уникальных файлов: $(echo "$UNIQUE_FILES_DIR2" | wc -l)\033[0m\n"
fi
