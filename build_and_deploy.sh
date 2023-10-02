#!/bin/bash
find static -type f -iname "*.jpg" -exec jpegoptim {} \;
find static -type f -iname "*.png" -exec optipng {} \;
rm -Rfv public
hugo
rsync -avz -e 'ssh -p 2222' --delete-after public/* renardspatial.com:/var/www/renardspatial.com
