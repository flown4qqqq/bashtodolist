#!/bin/bash

get_list () {
    local inprogress_flag=true
    local done_flag=false

    get_flags() {
        while getopts 'adi' flag; do
        case "${flag}" in
            a)
                inprogress_flag=true
                done_flag=true
            ;;

            d)
                inprogress_flag=false
                done_flag=true
            ;;

            i)
                inprogress_flag=true
                done_flag=false
            ;;

            *)
                echo 'uknkown flag'
                exit 1
            ;;
        esac
        done
    }

    get_flags $@;

    if $inprogress_flag ; then
        echo 'In progress:'
        cat -n $inprogress_file
    fi

    if $done_flag ; then
        echo 'Done:'
        cat -n $done_file
    fi
}
