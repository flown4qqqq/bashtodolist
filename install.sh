#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

user=$(who am i | awk '{print $1}')

main_dir=/usr/src/todo
data_dir=/home/$user/.tododata
mkdir -p $data_dir

>${data_dir}/inprogress.td
>${data_dir}/done.td

if [ -d "$main_dir" ]; then
    rm -rf $main_dir
fi

mkdir -p $main_dir

src_dir=$main_dir'/src'

cp -R src $src_dir
chmod 777 $src_dir/*

path_link=/usr/bin/todo

if [ -L $path_link ]; then
    rm $path_link
fi

ln -s $src_dir/main.sh $path_link
