#!/bin/bash
#
# Amir Samary - 2018
#
# This script is included on practically all other scripts
#

#
# CONSTANTS
#
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

#
# Utility functions
#
function showError() {
    red
    printf "\nERROR: $1\n"
    nocolor
}

function showMessage() {
    green
    printf "\n$1\n"
    nocolor
}

function printfY() {
    yellow
    printf "$1"
    nocolor
}

function printfR() {
    red
    printf "$1"
    nocolor
}

function printfG() {
    green
    printf "$1"
    nocolor
}

function nocolor() {
    printf "${NC}"
}

function yellow() {
    printf "${YELLOW}"
}

function red() {
    printf "${RED}"
}

function green() {
    printf "${GREEN}"
}

# checkError(errorMsg, successMsg)
# 
# If last command terminated with an error, prints errorMsg and exits with error returned.
# IF last command did not terminated with an error, prints successMsg.
function checkError() {
    if [ ! $? -eq 0 ]
    then 
        printfR "\n$1\n"
        exit $?
    else
        if [ ! -z "$2" ]
        then
            printfG "\n$2\n"
        fi
    fi
}