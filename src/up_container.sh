#!/bin/bash

ContainerName="local_install"
DockerImg="centos:latest"

# CentOSコンテナを立ち上げる。

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
