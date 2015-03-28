#!/bin/sh

for f in *; do
	echo $f
	# skip directories
	[ -d $f ] && continue
	case `file --mime-type $f | awk '{print $2}'` in
		application/gzip)  ext="gz";;
		application/pdf)   ext="pdf";;
		application/x-bzip2) ext="bz2";;
		application/x-debian-package) ext="deb";;
		application/x-dosexec) ext="exe";;
		application/x-rar) ext="rar";;
		application/zip)   ext="zip";;
		audio/mpeg)        ext="mp3";;
		audio/x-wav)       ext="wav";;
		binary)            ext="wav";;
		image/gif)         ext="gif";;
		image/jpeg)        ext="jpg";;
		image/png)         ext="png";;
		image/x-ms-bmp)    ext="bmp";;
		text/html)         ext="html";;
		text/plain)        ext="txt";;
		text/x-tex)        ext="tex";;
		video/mpeg)        ext="mpg";;
		video/x-msvideo)   ext="avi";;
	esac
	# do not handle this file if the extension already matches
	case $f in
		*$ext) continue
	esac
	mv ${f} ${f}.${ext}
	# now replace & and ? in f
	f=`echo "$f" | sed 's/?/%3F/g; s/&/%26/g'`
	perl -pi -e "s/\\Q${f}\\E([#\"])/${f}.${ext}\1/g" *
done
