#! /bin/bash

#一般用vundle不能安装成功youcompleteme插件，所以需要额外安装

if which bash > /dev/null; then                                                        # 如果存在这个命令，则开始进行下一步
    echo "bash命令存在！请您继续！"
if which apt-get > /dev/null; then 
    echo "您使用的是debain/ubuntu系列系统，庆继续下一步！"
    sudo apt-get install -y cmake gcc gdb make  python3-dev                            # 安装必要程序
    git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/ # 下载到这个目录
    git submodule update --init --recurslve                                            # 检查完整性
fi 

# 下载安装最新版libclang 
if which cmake > /dev/null; then 
    echo "您的系统拥有需要的安装环境，请您继续安装..."
    sudo apt-get install llvm-4.0 clang-4.0 libclang-4.0-dev libboost-all-dev          # c语义补全,注意，这个下载比较庞大，有700+ MB
fi 

#移动到~/.vim/bundle目录
cd ~/.vim/bundle/ 

#创建编译目录
mkdir ycm_build
#进入编译目录
cd ./ycm_build 
#生成makefile
cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
#构建ycm_core
cmake --build . --target ycm_core --config Release
#复制.ycm_extra_conf.py
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/

#将配置信息放入.vimrc中
#cat ~/.vim/youcompletemevimrc >> ~/.vimrc 
#这个vimrc脚本已经有了这个配置

echo "安装完成！"
