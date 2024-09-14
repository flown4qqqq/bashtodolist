#!/bin/bash

main_dir=~/.todo

inprogress_file=$main_dir/data/inprogress.td
done_file=$main_dir/data/done.td

. $main_dir/src/add.sh
. $main_dir/src/list.sh
. $main_dir/src/mark.sh

main() {
    local argc=$#

    if [ $argc -eq 0 ]; then
        echo 'Please, use "todo list" OR "todo add [arg]" OR "todo remove [arg]" OR "todo mark [arg]" '
        exit 1
    fi

    local command="$1"
    shift

    case $command in
        list)
            get_list "$@";
        ;;

        add)
            add_thing "$@";
        ;;

        mark)
            mark_thing "$@";
        ;;

        *)
            echo 'unknown command'
            exit 1
        ;;
    esac
}

main "$@"
