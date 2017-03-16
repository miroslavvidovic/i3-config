#!/bin/bash

updates=$(pacman -Qu | wc -l)

if [ "$updates" = "0" ];then 
    echo -e ""
else
    echo -e " $updates "
fi 
