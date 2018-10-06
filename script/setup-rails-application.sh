#!/usr/bin/env bash

# gemのインストールを行う
bundle install --path vendor/bundle
# データベースの作成とテーブルの作成を行う
bundle exec rake db:create db:migrate
# SEEDを流すが無ければSkipされる
bundle exec rake db:seed
# npmを一部利用している為実行
npm install
