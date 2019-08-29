#!/bin/bash

# パッケージをyumインストールする（download only mode）

# 設定ファイルの読み込み
. ./config/local_install.conf

# CentOSコンテナにヒアドキュメントでアクセス
docker exec -i $ContainerName /bin/bash <<- EOF
    # ダウンロード先のディレクトリ作成
    mkdir $DirName

    # ダウンロード実行
    yum install --downloadonly --downloaddir=${DirName} $@

    # リポジトリ作成用コマンドのインストール
    yum install -y createrepo

    # リポジトリの作成
    createrepo $DirName

    # 圧縮
    tar zcf $TarFileName $DirName
EOF

# 圧縮ファイル転送
docker cp ${ContainerName}:/${TarFileName} ./