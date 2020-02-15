#!/bin/bash

# 圧縮されたリポジトリファイルから、スタンドアロン環境にパッケージをインストールする
# インストールするパッケージを引数に入れる。複数可。

repoDir='/etc/yum.repos.d/'

# 入力チェック
if [ $# -eq 0 ]; then
    echo "Augument error: input the name of package to install"
    exit 1
fi

# 圧縮ファイルの解凍
rm -rf standalone_install
tar zxf standalone_install.tar.gz

# 古いリポジトリ設定ファイルの削除
find $repoDir -name 'standalone_install.repo' | xargs rm -f

# リポジトリ設定ファイルの作成
currentDir=`pwd`
sed -i -e "s@Path@${currentDir}/standalone_install@" ./standalone_install.repo
sudo cp ./standalone_install.repo ${repoDir}

# インストール実行
sudo yum install -y --disablerepo=\* --enablerepo=standalone_install $@

