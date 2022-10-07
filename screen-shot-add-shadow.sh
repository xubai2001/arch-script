#!/bin/bash -e

# 使用深度截图
# /usr/bin/deepin-screenshot -n
/usr/bin/deepin-screen-recorder -n

# 截图后从剪切板中读取图片至/tmp/src.png
sleep 0.3
xclip -selection clipboard -t image/png -o > /tmp/src.png

# 添加圆角
convert /tmp/src.png \
	  \( +clone -alpha extract \
	  -draw 'fill black polygon 0,0 0,8 8,0 fill white circle 8,8 8,0' \
	  \( +clone -flip \) -compose Multiply -composite \
	  \( +clone -flop \) -compose Multiply -composite \
    \) -alpha off -compose CopyOpacity -composite /tmp/output.png

# 添加白色背景和阴影、边框
convert /tmp/output.png -bordercolor none -border 20 \( +clone -background black -shadow 80x15+0+0 \) \
	+swap -background white -layers merge +repage /tmp/des.png

# 将生成的文件输出到剪切板
xclip -selection clipboard -t image/png -i /tmp/des.png

# 删除处理过程中生成的文件
rm /tmp/src.png /tmp/des.png /tmp/output.png

# 来源： https://blog.zjuyk.site/posts/clipboard-image-customize


