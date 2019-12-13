#!/usr/bin/env bash

if [ $# -le 2 ]; then
	echo "Insufficient parameter amount. Please specify three."
	echo "  Par1: checksum method."
	echo "  Par2: input filename or foldername."
    echo "  Par3: output foldername."
	exit 1;
fi

if $(command -v $1 >/dev/null 2>&1); then
    echo "Checksum method you provided doesn't exist";
    exit 1;
else
    CHECKSUM=$1
fi

command -v exiftool >/dev/null 2>&1 || {
    echo "You haven't install exiftool, install for you."
    case "$OSTYPE" in
	darwin*)
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
        brew install exiftool
        if $(command -v exiftool >/dev/null 2>&1); then
            echo "Install exiftool success."
        else
            echo "Install failed, please install exiftool by yourself."
            exit 1;
        fi
    ;;
	*)
        echo "Please install exiftool by yourself."
        exit 1;
    ;;
    esac
}

# executefile <input_file> <output_folder>
executefile () {
    filename=$(basename -- "$1")
    extension="${filename##*.}"

    check_sum=`$CHECKSUM "$1" | awk '{ print $1 }'`
    create_date=`exiftool -DateTimeOriginal -d "%Y%m%d" "$1" | awk -F ': ' '{ print $2 }'`

    echo "copy '$1' => '${2%%/}/$create_date-$check_sum.${extension}'"
    cp "$1" "${2%%/}/$create_date-$check_sum.${extension}"
}

# excutefolder <input_folder> <output_folder>
executefolder () {
    find "$1" -type f -maxdepth 1 | while read inf; do
        executefile "$inf" "$2"
    done
}

if [ ! -d "$3" ]; then
    echo "Please provide a output folder."; exit 1;
elif [ -f "$2" ]; then
    executefile "$2" "$3"
elif [ -d "$2" ]; then
    executefolder "$2" "$3"
fi
