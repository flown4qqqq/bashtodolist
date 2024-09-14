#!/bin/bash

is_number() {
    local re="^[+-]?[0-9]+$"
    if ! [[ $1 =~ $re ]] ; then
        echo false
        return
    fi

    echo true
}

mark_thing() {
    readarray -t all_inprogress < $inprogress_file

    local len=${#all_inprogress[@]}
    local id

    for id in "$@";
    do
        isn=$(is_number $id)

        if [ "$isn" == "false" ]; then
            echo $id is not number
        elif (( (($id)) < 1 )); then
            echo $id is invalid id
        else
            local j
            j=$(($id - 1))

            s="${all_inprogress[$j]}"

            if [ "$s" != "" ]; then
                echo "${all_inprogress[$j]}" >> $done_file
                all_inprogress[$j]=""

            fi
        fi
    done

    >$inprogress_file

    local i
    for i in $(seq 0 $(($len - 1)))
    do
        local thing
        thing="${all_inprogress[$i]}"
        if [ "$thing" != "" ]; then
            echo ${all_inprogress[$i]} >> $inprogress_file
        fi
    done
}
