#!/bin/bash


function get_prompt {

    if [ `pwd` == "/" ]; then
        pwd
        return
    fi

    _pwd=`pwd | sed "s#$HOME#~#"`

    if [ $_pwd == "~" ]; then
        echo "~"
        return
    fi

    arr=(`echo $_pwd | tr "/" " "`)

    length=${#arr[@]}

    last_element=$(expr $length - 1)
    loop_end=$(expr $length - 2)

    for i in $(seq 0 $loop_end); do
        arr[$i]=$(echo ${arr[$i]} | head -c 1)
    done

    if [ "${arr[0]}" == "~" ]; then
        result="~"
        loop_start=1
    else
        loop_start=0
    fi

    for i in $(seq $loop_start $loop_end); do
        result=$result/${arr[$i]}
    done

    echo $result/${arr[$last_element]}
}

function set_PS1 {
    PS1='\u:'$(get_prompt)'\$ '
}

export PROMPT_COMMAND="history -a; set_PS1"
