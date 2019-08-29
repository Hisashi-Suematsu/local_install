#!/bin/bash

# インストールするパッケージを引数に入れる。複数可。

# 入力チェック
if [ $# -eq 0 ]; then
    echo "Augument error: input the name of package to install"
    exit 1
fi

# CentOSコンテナの起動
./src/up_container.sh

# 起動チェック
if [ $? -eq 1 ]; then
    echo "Running container error: failed to running centos container"
    exit 1
fi
