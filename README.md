# bashPortraitize
A bash script that helps you rotate images to portrait in bulk based on exifdata

![](logo.png)


## Install
### The installer installs all requirements and the script itself
1. Clone the repository
2. sudo make install
```bash
git clone https://github.com/tragdate/bashPortraitize.git
cd bashPortraitize
sudo make install
```

## Usage
```
Usage: portraitize [working directory]
```

## Uninstall
```
sudo make uninstall
```

## License
[GPLv3](https://choosealicense.com/licenses/gpl-3.0/)

## Requirements
* [ImageMagick](https://imagemagick.org/index.php)
* [ExifTool](https://exiftool.org/)
* The picture must have valid exifdata
