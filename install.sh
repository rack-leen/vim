#!/bin/bash
echo "这个脚本可以在ubuntu/linuxmint系列系统使用!"
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"

if which apt-get >/dev/null; then #如果检测到apt-get，则进行下一步
    sudo apt-get install -y git make gcc gdb cmake ctags  #安装基本环境
	echo "基本环境安装完成！"
fi

#进入主目录
cd ~/

#===============================================================================
#安装vim
#===============================================================================
echo "开始安装vim8.0"
git clone http://github.com/vim/vim.git
#进入vim目录
cd vim/ 

#安装vim所需环境
sudo apt-get lua5.3 python python2.7 python3 ruby  
sudo apt-get install python-dev python3-dev ruby-dev lua-dev libx11-dev libgtk2.0-dev libgtk-3-dev libncurses5-dev

#编译安装vim
./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
make 
sudo make install 

echo "vim8.0安装完成！"

#===============================================================================
#安装其他部件
#===============================================================================
sudo easy_install -ZU autopep8 
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

#===============================================================================
# 对本地文件进行操作
#===============================================================================
mv -f ~/vim ~/vim_old                                                          # 将原来的vim8.0移至vim_old
mv -f ~/.vim ~/.vim_old　                                                      # 将原来的.vim文件移至.vim_old
cd ~/ && git clone http://github.com/rack-leen/vim.git                         # 将仓库下载至主目录
mv -f ~/vim ~/.vim                                                             # 将下载的文件移至.vim
mv -f ~/.vimrc ~/.vimrc_old                                                    # 将原来的.vimrc移至.vimrc_old
mv -f ~/.vim/.vimrc ~/                                                         # 将下载的.vimrc移至主目录
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # 插件管理
echo "ma6174正在努力为您安装bundle程序" > 1
echo "安装完毕将自动退出" >> 1
echo "请耐心等待..." >> 1
vim 1 -c "PluginInstall" -c "q" -c "q"
rm 1
echo "安装完成"
echo "如果您需要youcompleteme语义补全支持，请运行.vim/youcompleteme.sh脚本!"
