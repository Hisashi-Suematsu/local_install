#!/bin/bash

# CentOSコンテナを停止する

# 設定ファイルの読み込み
. ./config/standalone_install.conf

# 起動中のコンテナをチェック
exitRunningContainer=`docker ps | grep $ContainerName | wc -l`
if [ $exitRunningContainer -eq 1 ]; then
    echo "Stopping ${ContainerName}..."
    docker stop $ContainerName
fi

# 停止中のコンテナをチェック
exitStoppingContainer=`docker ps -a | grep $ContainerName | wc -l`
if [ $exitStoppingContainer -eq 1 ]; then
    echo "Removing ${ContainerName}..."
    docker rm -f $ContainerName
fi