source "https://rubygems.org"
ruby "2.4.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "active_model_serializers", "~> 0.10.0"
gem "bcrypt", "~> 3.1.7"
gem "jwt"
gem "rails", "~> 5.0.6"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem 'will_paginate', '~> 3.1.0'

group :development, :test do
  gem "byebug", platform: :mri
  gem "factory_girl_rails", "~> 4.0"
  gem "faker"
  gem "guard-rspec", require: false
  gem "rspec-rails", "~> 3.5"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "spring"
end

group :test do
  gem "shoulda-matchers", "~> 3.1"
  gem "database_cleaner"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
