#!/bin/bash

declare -a repo_list=("https://github.com/vim-airline/vim-airline.git" \
                      "https://github.com/vim-airline/vim-airline-themes.git" \
                      "https://github.com/dense-analysis/ale.git" \
                      "https://github.com/morhetz/gruvbox.git" \
                      "https://github.com/Yggdroot/indentLine.git" \
                      "https://github.com/scrooloose/nerdtree.git" \
                      "https://github.com/justinmk/vim-syntax-extra.git")

if [ -f "$HOME/.vimrc" ]; then
    echo "Fatal: File ~/.vimrc already exists"
    exit 1
fi
if [ -d "$HOME/.vim" ]; then
    echo "Fatal: Directory ~/.vim already exists"
    exit 1
fi

orig_dir=$(pwd)

cp .vimrc $HOME/.vimrc
cp -r .vim $HOME/.vim

if [ ! -d "$HOME/.vim/bundle" ]; then
    mkdir $HOME/.vim/bundle
fi

cd $HOME/.vim/bundle

for repo in ${repo_list[@]}; do
    git clone $repo
done

cd $orig_dir
