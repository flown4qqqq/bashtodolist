#!/bin/bash

add_thing() {
    local thing
    for thing in "$@"
    do
        echo $thing >> $inprogress_file
    done
}
