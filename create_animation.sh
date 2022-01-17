# dump the frames of an animation into a folder, then use ImageMagick's convert to make them into a gif. `-resize 20%` or `-resize 1920x1080` can be used to change the resolution of the gif
convert -delay 3 -loop 0 animations/*.png myimage.gif
