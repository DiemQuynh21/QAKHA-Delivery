                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "active_storage_validations", "0.8.2"
gem "activerecord-session_store"
gem "active_model_serializers"
gem "bootsnap", ">= 1.4.2", require: false
gem "config"
gem 'devise', github: 'heartcombo/devise', branch: 'ca-omniauth-2'
gem "faker", :git => "https://github.com/faker-ruby/faker.git", :branch => "master"
gem "figaro"
gem "image_processing", "1.9.3"
gem "jbuilder", "~> 2.7"
gem "jwt"
gem "mini_magick", "4.9.5"
gem "mysql2", ">= 0.4.4"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.5"
gem "rails-i18n"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-facebook"
gem 'omniauth-rails_csrf_protection'
gem "webpacker", "~> 4.0"
gem 'rack-cors'

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
