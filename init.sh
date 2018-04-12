#########################################################################
# File Name: init.sh
# Author: mxl
# Mail: xiaolongicx@gmail.com
# Created Time: Tue 10 Apr 2018 10:50:53 AM CST
#########################################################################
#!/usr/bin/env bash

set -e

WORKDIR=$(dirname $0)
CURDIR=$(pwd)

cd $WORKDIR

if [ ! -f vimrc -o  ! -f vimrc.bundles ]; then
    echo "Can't find vimrc or vimrc.bundles in working directory. Make sure execute likes ./init.sh"

    cd $CURDIR
    exit -1
fi

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -f ~/.vimrc ]; then
    \mv ~/.vimrc ~/.vimrc.bak
fi

cp vimrc ~/.vimrc

if [ -f ~/.vimrc.bundles ]; then
    \mv ~/.vimrc.bundles ~/.vimrc.bundles.bak
fi

cp vimrc.bundles ~/.vimrc.bundles

vim "+PluginInstall" "+qa"

cd $CURDIR

