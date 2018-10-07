# frozen_string_literal: true

# Installation source of gem
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby Version Lock
ruby '2.5.1'

# Core Gems
gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '~> 1.3', '>= 1.3.2'

#
# Add Self Gems
#

# - 環境変数を扱えるようにする
#   .env ファイル内に KEY=bigtweet のように記述する事で
#   ENV['KEY'] を利用する事が可能になる
gem 'dotenv-rails', '~> 2.5'

# - 画像をアップロード可能な状態にする
gem 'carrierwave', '~> 1.2', '>= 1.2.3'

# - 画像をリサイズしたりコンバートする
gem 'mini_magick', '~> 4.9', '>= 4.9.2'

# - クラウドプロバイダを利用可能にする
gem 'fog', '~> 2.0'

# - Bootstrap4
gem 'bootstrap', '~> 4.0.0.beta2.1'

# - jquery
#   Bootstrapを利用する為に必要
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'

# - Google Analytics
gem 'google-analytics-rails', '~> 1.1', '>= 1.1.1'

# - FontAwesome
#   https://fontawesome.com/
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller' 
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
