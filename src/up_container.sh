#!/bin/bash

# CentOSコンテナを立ち上げる。

# 設定ファイルの読み込み
. ./config/standalone_install.conf

# CentOSコンテナの停止
./src/down_container.sh

# CentOSコンテナの立ち上げ
echo "Running ${ContainerName}..."
docker run -id --name $ContainerName $DockerImg /bin/bash

# 起動チェック
exitRunningContainer=`docker ps | grep $ContainerName | wc -l`
if [ $exitRunningContainer -eq 1 ]; then
    exit 0
else
    exit 1
fi
