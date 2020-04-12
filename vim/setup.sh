#!/bin/bash

root="$HOME"
vim_dir=".vim"
vimrc=".vimrc"

while [[ $# -gt 0 ]]; do
    key=$1
    case $key in
    -w|--windows)
        vim_dir="vimfiles"
        vimrc="_vimrc"
        shift
    ;;
    -p|--path)
        root="$2"
        shift
        shift
    ;;
    -h|--help)
        echo "Usage: $0 [-w|--windows] [-p|--path <path-to-home>]"
        echo " -w, --windows: Changes .vim and .vimrc to vimfiles and _vimrc respectively"
        echo " -p, --path   : Specify the path place the configuration files in"
        exit 0
    ;;
    *)
        echo "Fatal: Unrecognized argument \"$key\". See --help for usage."
        exit 1
    ;;
    esac
done

vim_dir_path="$root/$vim_dir"
vimrc_path="$root/$vimrc"

echo ".vim path:   $vim_dir_path"
echo ".vimrc path: $vimrc_path"
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1


declare -a repo_list=("https://github.com/vim-airline/vim-airline.git" \
                      "https://github.com/vim-airline/vim-airline-themes.git" \
                      "https://github.com/dense-analysis/ale.git" \
                      "https://github.com/morhetz/gruvbox.git" \
                      "https://github.com/Yggdroot/indentLine.git" \
                      "https://github.com/scrooloose/nerdtree.git" \
                      "https://github.com/justinmk/vim-syntax-extra.git" \
                      "https://github.com/chriskempson/base16-vim.git" \
                      "https://github.com/arcticicestudio/nord-vim.git" \
                      "https://github.com/MTDL9/vim-log-highlighting.git" \
                      "git://github.com/majutsushi/tagbar" \
                      "https://github.com/xolox/vim-misc.git" \
                      "https://github.com/xolox/vim-session.git")

if [ -f "$vimrc_path" ]; then
    echo "Fatal: File $vimrc_path already exists"
    exit 1
fi
if [ -d "$vim_dir_path" ]; then
    echo "Fatal: Directory $vim_dir_path already exists"
    exit 1
fi

orig_dir=$(pwd)

cp .vimrc $vimrc_path
cp -r .vim $vim_dir_path

if [ ! -d "$vim_dir_path/bundle" ]; then
    mkdir $vim_dir_path/bundle
fi

cd $vim_dir_path/bundle

for repo in ${repo_list[@]}; do
    git clone $repo
done

cd $orig_dir
