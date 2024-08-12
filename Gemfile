# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 6.1.4"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "redis", "~> 4.0"
gem "devise", "~> 4.8"
gem "devise-i18n"
gem "rails-i18n", "~> 6.0.0"
gem "administrate"

gem "haml"
gem "haml-rails"
gem "bootstrap-email", ">= 1.0.0.alpha"

gem "sidekiq", "~> 6.0"
gem "sidekiq-scheduler"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails_config", require: false
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "spring"
  gem "foreman", require: false
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "mocha"
  gem "rails-controller-testing"
  gem "shoulda-matchers", "~> 5.0"
  gem "shoulda-context", "~> 2.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "rails-erd", "~> 1.7", :group => :development
