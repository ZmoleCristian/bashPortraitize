#!/bin/bash
#set first argument as working directory variable
WORKING_DIR=$1
#get all pictures in working directory
#if no argument is supplied show help and exit
if [ -z "$1" ]; then
    echo "";
    echo "  Portraitize - A script to make your landscape pictures portrait"
    echo "  Usage: portraitize [working directory]"
    echo "  To run in current folder just run:"
    echo "    portraitize ."
    exit 1
fi

#Check if there are any pictures in the working directory
if [ -z "$(find $WORKING_DIR -type f -name "*.jpg" -o -name "*.JPG" -o -name "*.jpeg" -o -name "*.JPEG" -o -name "*.png" -o -name "*.PNG")" ]; then
	echo "  Error: No pictures found in working directory"
	exit 1
fi

#Check if working directory writable
if [ ! -w $WORKING_DIR ]; then
	echo "  Error: Working directory is not writable"
	exit 1
fi

PICTURES=$(find $WORKING_DIR -type f -name "*.jpg" -o -name "*.JPG" -o -name "*.jpeg" -o -name "*.JPEG" -o -name "*.png" -o -name "*.PNG")
#Iterate through all the pictures in the current directory
for file in $PICTURES
do
  #Check the orientation of the picture
	[ "$(exiftool $file | grep '^Image Height' | awk -F ":" '{print $2}')" -lt "$(exiftool $file | grep '^Image Width' | awk -F ":" '{print $2}')" ] &&
		if [ "$(exiftool $file | grep Orientation | awk -F "[()]" '{print $2}')" == "normal" ]
		then
		  #If the picture is oriented vertically to the right, rotate it 90 degrees to the left
			convert -rotate 90 $file $file
		else
      #If the picture is oriented vertically to the left, rotate it 90 degrees to the right
			convert -rotate -90 $file $file
		fi
	done
