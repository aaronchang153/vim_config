#!/bin/bash

if [ $# == 0 ]; then
    VIM="$HOME/.vim"
    VIMRC="$HOME/.vimrc"
elif [ $# == 2 ]; then
    if [ "$1" == "--win" ]; then
        VIM="$2/vimfiles"
        VIMRC="$2/_vimrc"
    else
        echo "Fatal: Unrecognized argument: $1"
        exit 1
    fi
else
    echo "Usage: $0 [--win <home-path>]"
    exit 1
fi

echo ".vim path:   $VIM"
echo ".vimrc path: $VIMRC"
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1


declare -a repo_list=("https://github.com/vim-airline/vim-airline.git" \
                      "https://github.com/vim-airline/vim-airline-themes.git" \
                      "https://github.com/dense-analysis/ale.git" \
                      "https://github.com/morhetz/gruvbox.git" \
                      "https://github.com/Yggdroot/indentLine.git" \
                      "https://github.com/scrooloose/nerdtree.git" \
                      "https://github.com/justinmk/vim-syntax-extra.git")

if [ -f "$VIMRC" ]; then
    echo "Fatal: File $VIMRC already exists"
    exit 1
fi
if [ -d "$VIM" ]; then
    echo "Fatal: Directory $VIM already exists"
    exit 1
fi

orig_dir=$(pwd)

cp .vimrc $VIMRC
cp -r .vim $VIM

if [ ! -d "$VIM/bundle" ]; then
    mkdir $VIM/bundle
fi

cd $VIM/bundle

for repo in ${repo_list[@]}; do
    git clone $repo
done

cd $orig_dir
