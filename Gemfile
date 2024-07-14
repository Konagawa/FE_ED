source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.3"
gem "rails",           "7.0.4.3"
gem 'bootstrap', '~> 5.3.0'
gem "bootstrap_form"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem 'font-awesome-sass'
# sassをを使用するために用いられるgem,非推奨らしい
gem "sassc-rails",     "2.1.2"
# アセットパイプライン機能の提供
gem "sprockets-rails", "3.4.2"
# バンドラーを使用せずにjavascriptモジュールを直接インポートできる
gem "importmap-rails", "1.1.5"
# Hotwireの一部
gem "turbo-rails",     "1.4.0"
# Hotwireの一部　DOM操作を任せられる
gem "stimulus-rails",  "1.2.1"
# JSON形式の文字列データを作成する
gem "jbuilder",        "2.11.5"
# HTTPサーバー、これのおかげで　rails s　ができてる
gem "puma",            "5.6.8"
# いれるだけでアプリを高速化してくれるやつ
gem "bootsnap",        "1.16.0", require: false
# DB
# gem "sqlite3",         "1.6.1"
gem "pg"

#パスワードハッシュ化
gem "bcrypt"
gem "kaminari"
gem "ransack"

group :development, :test do
  # 名前の通り、デバッグに必要なやつ。
  gem "debug",   "1.7.1", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # View内でコンソールを立ち上げて変数とかの状態を見るデバッグ用ライブラリ
  gem "web-console",         "4.2.0"
  # コード保管、関数の説明等インテリセンスが使える
  gem "solargraph",          "0.50.0"
  # rails c　できるようにしてくれてる
  gem "irb",                 "1.10.0"
  # irbの機能を拡張してくれるやつ
  gem "repl_type_completor", "0.1.2"
end

group :test do
  gem "capybara",                 "3.38.0"
  gem "selenium-webdriver",       "4.8.3"
  gem "webdrivers",               "5.2.0"
  gem "rails-controller-testing", "1.0.5"
  gem "minitest",                 "5.18.0"
  gem "minitest-reporters",       "1.6.0"
  gem "guard",                    "2.18.0"
  gem "guard-minitest",           "2.4.6"
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
