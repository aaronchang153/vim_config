#!bin/bash

#only for Linux right now

vimplug_dir="~/.local/share/nvim/site/autoload"
nvim_root="~/.config/nvim"

mkdir -p $vimplug_dir
cp plug.vim $vimplug_dir

mkdir -p $nvim_root
cp init.vim $nvim_root
