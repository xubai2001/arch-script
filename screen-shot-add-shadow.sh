#!/bin/bash -e
/usr/bin/deepin-screenshot -n
# scrot --select "/tmp/src.png"
sleep 0.3
xclip -selection clipboard -t image/png -o > /tmp/src.png
convert /tmp/src.png \
	  \( +clone -alpha extract \
	  -draw 'fill black polygon 0,0 0,8 8,0 fill white circle 8,8 8,0' \
	  \( +clone -flip \) -compose Multiply -composite \
	  \( +clone -flop \) -compose Multiply -composite \
    \) -alpha off -compose CopyOpacity -composite /tmp/output.png

convert /tmp/output.png -bordercolor none -border 20 \( +clone -background black -shadow 100x15+0+0 \) \
	+swap -background white -layers merge +repage /tmp/des.png

xclip -selection clipboard -t image/png -i /tmp/des.png

rm /tmp/src.png /tmp/des.png /tmp/output.png


