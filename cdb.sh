#!/bin/bash

# name: CDBookmarks
# date: 10-02-2024
# author: Timo Kats

BOOKMARK_FILE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/.bookmarks.txt"
RED='\033[0;31m'
NC='\033[0m'

# helper functionalities

responsive_tab() {
  string=$1
  declare -i size=15-${#string}
  for i in $( seq 0 $size )
  do
    echo -n " " 
  done
}

# informative functionalities

info() {
  echo "---"
  echo "CDBookmark is maintained by Timo Kats (tpakats@gmail.com)."
  echo "Last update: 10 Feb 2024"
  echo "License: GNU GPLv3"
  echo "Version: v1.0.0"
  echo "---"
  echo "Current bookmark location:" $BOOKMARK_FILE
  echo "---"
}

list_bookmarks() {
  while IFS=' ' read -r key value; do
    echo -n -e "${RED}"$key"${NC}"
    responsive_tab $key
    echo $value
  done < $BOOKMARK_FILE 
}

# core functionalities

add_bookmark() {
  if [ $# -gt 1 ]; then
    echo $2 $PWD >> $BOOKMARK_FILE 
    echo "added" $PWD "as" $2 "to bookmarks"
  else
    echo "missing bookmark name"
  fi
}

use_bookmark() {
  while IFS=' ' read -r key value; do
      if [ "$1" == "$key" ]; then
        cd $value
      fi
  done < $BOOKMARK_FILE 
}

delete_bookmark() {
  sed -i "/$1 /d" $BOOKMARK_FILE 
}

init_bookmarks() {
  cat > $BOOKMARK_FILE
}

allocate_function() {
  if [ $1 == "add" ]; then
    add_bookmark $1 $2
  elif [ $1 == "list" ]; then
    list_bookmarks
  elif [ $1 == "delete" ]; then
    delete_bookmark $2
  elif [ $1 == "info" ]; then
    info
  else
    use_bookmark $1
  fi
}

# main runner function
if [ $# -lt 1 ]; then
  echo "Supported arguments: {add, list, delete, info, <<bookmark>>}" 
else
  if [ ! -f $BOOKMARK_FILE ]; then
    init_bookmarks
  fi
  allocate_function $1 $2
fi

