#!/bin/sh

#=====================================
#删除当前用户vim配置文件
#=====================================
rm -f ~/.vimrc
rm -rf ~/.vim
mv -f ~/.vimrc_old ~/.vimrc
mv -f ~/.vim_old ~/.vim
