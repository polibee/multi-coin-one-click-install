#!/bin/bash

echo "安装依赖..."
sudo apt update
sudo apt install -y build-essential cmake libuv1-dev libssl-dev libhwloc-dev wget

echo "下载 xmrig 源代码..."
sudo wget -O v6.20.0.tar.gz https://github.com/xmrig/xmrig/archive/refs/tags/v6.20.0.tar.gz
sudo tar -zxvf v6.20.0.tar.gz

echo "编译 xmrig..."
cd xmrig-6.20.0
sudo mkdir build
cd build
sudo cmake ..
sudo make

echo "启动 xmrig..."
echo "使用以下命令在后台启动 xmrig："
echo "screen -S xmrig -dm ~/xmrig-6.20.0/build/xmrig -a rx -o stratum+ssl://rx.unmineable.com:443 -u DOGE:DKEfmGknGtdY9gEs4YJS9fTSmAtH7eAUdn.unmineable_worker_tiahnyqc#dsti-8isi --log-file xmrig.log"
echo "使用以下命令查看screen 会话："
echo "screen -ls"
echo "使用以下命令查看 xmrig 会话ID："
echo "screen -ls | grep xmrig"
echo "如果要看xmrig日志，请运行以下命令：（将12345.xmrig改为你的会话ID）"
echo "screen -r 12345.xmrig"
echo "如果要卸载 xmrig，请运行以下命令："
echo "sudo rm -rf ~/xmrig-6.20.0"
