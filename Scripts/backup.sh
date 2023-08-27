#!/bin/bash
#
# NAME      bkp.sh
# VERSION   2.7.2
# REQUIRED  bash, awk, du, cut, lscpu, tar, gzip, bzip2, 7z, xz
#



fn_abort()
{
    ERRCODE=$?
    echo >&2 "Error $ERRCODE executing $BASH_COMMAND on line ${BASH_LINENO[0]}"
    exit $ERRCODE
}

trap fn_abort ERR
set -o errtrace -o pipefail



echo "Create a backup using tar";



show_usage()
{
    echo "Usage: "`basename $0`" [OPTION]... <object_to_backup> [destination_path]";
}

show_help()
{
    show_usage;
    echo;
    echo "  -h              Show this help";
    echo "  -t, --tar       Uses tar without compression";
    echo "  -g, --gzip      Uses tar with gzip compression (default)";
    echo "      --gzipFast  Uses tar with gzip compression";
    echo "                  using fast compression";
    echo "  -j, --bzip2     Uses tar with bzip2 compression";
    # echo "  -z, --zip       Uses tar with zip compression";
    echo "  -x, --xz        Uses tar with xz compression";
    echo "  -7, --7zip      Uses tar with 7zip compression";
    echo "      --7lim      Uses tar with 7zip compression";
    echo "                  limit 7zip file size to 1GB";
    echo "      --7limFast  Uses tar with 7zip compression";
    echo "                  limit 7zip file size to 1GB";
    echo "                  using fast compression";
}



####
# Default vars
####

COMMAND="| gzip >";
EXT=".tar.gz";
CORES=$(( $(lscpu | awk '/^Socket/{ print $2 }') * $(lscpu | awk '/^Core/{ print $4 }') ));



####
# Check
####

# from http://mywiki.wooledge.org/BashFAQ/035

while test $# -gt 0
do
    case "$1" in
        -h | -\? | --help )
            show_help;
            exit 0;
            ;;
        -t | --tar )
            COMMAND=">";
            EXT=".tar";
            shift;
            ;;
        -g | --gzip )   # default
            shift;
            ;;
        --gzipFast )
            COMMAND="| gzip --fast >";
            EXT=".tar.gz";
            shift;
            ;;
        -j | --bzip2 )
            COMMAND="| bzip2 >";
            EXT=".tar.bz2";
            shift;
            ;;
        # -z | --zip )
        #     COMMAND="| zip -r -";
        #     EXT=".zip";
        #     shift;
        #     ;;
        -x | --xz )
            COMMAND="| xz -z >";
            EXT=".tar.xz"
            shift;
            ;;
        -7 | --7zip )
            COMMAND="| 7z a -bd -si -t7z > /dev/null";
            EXT=".tar.7z";
            shift;
            ;;
        --7lim )
            COMMAND="| 7z a -bd -si -t7z -v1g -m0=LZMA2 -mmt=${CORES} > /dev/null";
            EXT=".tar.7z";
            shift;
            ;;
        --7limFast )
            COMMAND="| 7z a -bd -si -t7z -v1g -m0=LZMA2:d64k:fb32 -ms=8m -mmt=${CORES} -mx=3 > /dev/null";
            EXT=".tar.7z";
            shift;
            ;;
        *)
            if test -z "${TARGET_PATH}"
            then
                TARGET_PATH="$1";
            elif test -z "${DEST_PATH}"
            then
                DEST_PATH="$1";
            else
                TOO_MUCH_ARGUMENTS="true";
            fi;
            shift;
            ;;
    esac;
done;

if test ! -z "${TOO_MUCH_ARGUMENTS}"
then
    echo "Error: too much arguments." >&2;
    show_usage >&2;
    exit 1;
fi;

if test ! -e "${TARGET_PATH}"
then
    echo "Error: <object_to_store> must be specified and must exists." >&2;
    show_usage >&2;
    exit 2;
fi;

if test -z "${DEST_PATH}"
then
    DEST_PATH=".";
elif test ! -d "${DEST_PATH}"
then
    echo "Error: <destination_path> must exists." >&2;
    show_usage >&2;
    exit 3;
fi;



####
# Execute
####

# define a name
TARGET_FILE=`echo ${TARGET_PATH} | awk 'BEGIN {FS="/"} {print $(NF)}'`;
if test "${TARGET_FILE}" = ""
then                    # if $? is empty then "$1" end with /, so
    TARGET_FILE=`echo ${TARGET_PATH} | awk 'BEGIN {FS="/"} {print $(NF-1)}'`;
fi;

DEST_FILE="${DEST_PATH}/bkp_${TARGET_FILE}_"`date +%Y-%m-%d`"${EXT}";

# add a timestamp if file alredy exist
if test -f "${DEST_FILE}"
then
    DEST_FILE="${DEST_PATH}/bkp_${TARGET_FILE}_"`date +%Y-%m-%d_%H-%M-%S`"${EXT}";
fi;

FROMSIZE=`du --apparent-size -sk "${TARGET_PATH}" | cut -f 1`;
CHECKPOINT=`echo ${FROMSIZE}/50 | bc`;

# compress
echo "Command:   tar -cf -" \"${TARGET_PATH}\" ${COMMAND} \"${DEST_FILE}\";
echo "Estimated: [==================================================]";
echo -n "Progess:   [";
eval tar -c --record-size=1K --checkpoint="${CHECKPOINT}" --checkpoint-action="ttyout=\>" -f - \"${TARGET_PATH}\" ${COMMAND} \"${DEST_FILE}\";
test "$?" -ne 0 && { echo -e "\nError, exit." >&2 ; exit 4; };
echo "]"

# see the result
ls --color -hl "${DEST_FILE}"*;



# End
