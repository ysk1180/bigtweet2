#!/usr/bin/env bash

# 定義
# direnv や env などで環境変数に WEB_IP と WEB_PORT を用意した
# これらがexportされていればその値を利用し、なければデフォルト値を利用するようになっている

# ip
WEB_IP=${WEB_IP:-'0.0.0.0'}
# port
WEB_PORT=${WEB_PORT:-'3000'}

# rails command
bundle exec rails s -b ${WEB_IP} -p ${WEB_PORT}
