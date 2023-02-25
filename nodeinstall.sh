#!/bin/bash

# 检查是否为root用户
if [ "$(id -u)" != "0" ]; then
   echo "此脚本必须以root用户运行" 1>&2
   exit 1
fi

# 下载并解压缩node
cd /root
wget https://nodejs.org/dist/v18.14.2/node-v18.14.2.tar.gz
tar -xzf node-v18.14.2.tar.gz

# 安装node
cd node-v18.14.2
./configure
make
make install

# 设置环境变量
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc

# 清理
rm -rf /root/node-v18.14.2
rm -f /root/node-v18.14.2.tar.gz