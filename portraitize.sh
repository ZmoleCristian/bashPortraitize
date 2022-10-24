#!/bin/bash
for file in *.jpg
do
	[ "$(exiftool $file | grep 'Exif Image Height' | awk -F ":" '{print $2}')" -lt "$(exiftool $file | grep 'Exif Image Width' | awk -F ":" '{print $2}')" ] &&
		if [ "$(exiftool $file | grep Orientation | awk -F "[()]" '{print $2}')" == "normal" ]
		then
			convert -rotate 90 $file $file
		else

			convert -rotate -90 $file $file
		fi
	done
