#!/bin/bash
# This script will install the required packages for the script to run

# check root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#gets the package manager and define a variable for it to be used later and sets the names of the packages according to the package manager
if [ -f /usr/bin/apt-get ]; then
  PM="apt-get"
  PM_INSTALL="install"
  PM_PACKAGES="imagemagick libimage-exiftool-perl"
  PM_YES="-y"
elif [ -f /usr/bin/yum ]; then
  PM="yum"
  PM_INSTALL="install"
  PM_PACKAGES="gcc php-devel php-pear ImageMagick ImageMagick-devel ImageMagick-perl perl-Image-ExifTool"
  PM_YES="-y"
elif [ -f /usr/bin/pacman ]; then
  PM="pacman"
  PM_INSTALL="-S"
  PM_PACKAGES="libltdl  lcms2  fontconfig  libxext  liblqr  libraqm libpng  libxml2 imagemagick perl perl-image-exiftool"
  PM_YES="--noconfirm --needed"

else
  echo "No compatible package manager found"
  exit 1
fi

#installs the packages
$PM $PM_INSTALL $PM_PACKAGES $PM_YES