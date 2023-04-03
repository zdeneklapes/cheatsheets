#!/bin/bash
#set -x # log
RM="rm -rfd"
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'

AUTHOR='Zdenek Lapes'
EMAIL='lapes.zdenek@gmail.com'

PROJECT_NAME='rl-cheatsheet'

################################################################################
# Functions
################################################################################
function error_exit() {
    printf "${RED}ERROR: $1${NC}\n"
    usage
    exit 1
}
function make_all() {
    rm -rfd "pdfs" && mkdir "pdfs"
    for folder in "rl"; do
        cd "${folder}" || error_exit "Cannot cd to ${folder}"
        make || error_exit "Cannot make in ${folder}"
        cp out/*.pdf ../pdfs/${folder}.pdf || error_exit "Cannot copy pdfs"
        cd - || error_exit "Cannot cd to -"
        echo "Make in $folder"
    done
}

function usage() {
    echo "USAGE:
    TODO
"
    local ENNNN=10
}

##### PARSE CLI-ARGS
[[ "$#" -eq 0 ]] && usage && exit 0
while [ "$#" -gt 0 ]; do
    case "$1" in
    "-m" | "--make") make ;;
    "-ma" | "--make-all") make_all ;;
    "-h" | "--help" | *) usage ;;
    esac
    shift
done
