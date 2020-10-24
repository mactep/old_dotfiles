#!/bin/bash

dir=$(dirname -- "$(readlink -f -- "$0")")
echo $dir

ln -s $dir/gsimplecal ~/.config
ln -s $dir/i3 ~/.config
ln -s $dir/mpv ~/.config
ln -s $dir/nvim ~/.config
ln -s $dir/Xdefaults ~/.Xdefaults
