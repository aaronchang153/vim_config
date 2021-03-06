#!/bin/bash

vim_dir_name=".vim"
vimrc_name=".vimrc"

vim_dir_path="$HOME"
vimrc_path="$HOME"

windows=false
nvim=false

force=false

while [[ $# -gt 0 ]]; do
    key=$1
    case $key in
    -w|--windows)
        windows=true
        shift
    ;;
    -n|--neovim)
        nvim=true
        shift
    ;;
    -p|--path)
        root="$2"
        shift
        shift
    ;;
    -f)
        force=true
        shift
    ;;
    -h|--help)
        echo "Usage: $0 [-w|--windows] [-n|--neovim] [-p|--path <path-to-home>]"
        echo " -w, --windows: Changes .vim and .vimrc to vimfiles and _vimrc respectively"
        echo " -n, --neovim : Move files to neovim directories"
        echo " -p, --path   : Specify the path place the configuration files in"
        echo " -f           : Delete .vim and .vimrc without prompt"
        exit 0
    ;;
    *)
        echo "Fatal: Unrecognized argument \"$key\". See --help for usage."
        exit 1
    ;;
    esac
done

# Adjust names and locations of .vim directory and .vimrc
# Default is .vim and .vimrc on Linux
if [ "$nvim" = true ]; then
    if [ "$windows" = true ]; then
        vim_dir_path="$HOME/AppData/Local"
        vimrc_path="$HOME/AppData/Local/nvim"
        vim_dir_name="nvim"
        vimrc_name="init.vim"
    else
        vim_dir_path="$HOME/.local/share/nvim"
        vimrc_path="$HOME/.config/nvim"
        vim_dir_name="site"
        vimrc_name="init.vim"
    fi
else # not neovim
    if [ "$windows" = true ]; then
        vim_dir_path="$HOME"
        vimrc_path="$HOME"
        vim_dir_name="vimfiles"
        vimrc_name="_vimrc"
    fi
fi

vim_dir="$vim_dir_path/$vim_dir_name"
vimrc="$vimrc_path/$vimrc_name"

echo "$vim_dir_name path: $vim_dir"
echo "$vimrc_name path: $vimrc"
read -p "Continue? (y/N): "
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Exitting..."
    echo
    exit 1
fi

if [ "$force" = true ]; then
    echo
    echo "Deleting vimrc and vim directory"
    rm -rf $vim_dir $vimrc
fi

if [ -f "$vimrc" ]; then
    echo
    read -p "File $vimrc already exists. Delete it? (y/N): "
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exitting..."
        echo
        exit 1
    fi
fi

echo
echo "Copying .vimrc to $vimrc"
cp .vimrc $vimrc

echo
echo "Downloading vim-plug to $vim_dir/autoload/plug.vim"
curl -fLo $vim_dir/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo
echo "Creating undo directory"
mkdir -p $vim_dir/undodir

echo
echo "Setup complete"
echo
