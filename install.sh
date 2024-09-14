#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

main_dir=/usr/src/todo

if [ -d "$main_dir" ]; then
    rm -rf $main_dir
fi

mkdir -p $main_dir
mkdir -p $main_dir/data

src_dir=$main_dir'/src'

cp -R src $src_dir
chmod 777 $src_dir/*

>${main_dir}/data/inprogress.td
>${main_dir}/data/done.td

path_link=/usr/bin/todo

if [ -L $path_link ]; then
    rm $path_link
fi

ln -s $src_dir/main.sh $path_link
