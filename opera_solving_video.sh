#!/bin/bash
cd /tmp;
wget https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/0.50.2/0.50.2-linux-x64.zip;
unzip 0.50.2-linux-x64.zip;
sudo rm /usr/lib64/opera/libffmpeg.so;
sudo mv libffmpeg.so /usr/lib64/opera/;
echo "Solved!";
