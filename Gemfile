# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "active_model_serializers", "~> 0.10.0"
gem "api_guard"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.4", require: false
gem "cancancan"
gem "puma", ">= 6.0"
gem "rack-cors"
gem "rails", "~> 7.1.0"
gem "swagger-blocks"
gem "sqlite3", "~> 1.4"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
  gem "rubocop-rails"
  gem "rubocop-rails_config"
  gem "solargraph"
  gem "rspec-rails"
end

group :development do
  gem "listen", "~> 3.3"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "geocoder", "~> 1.6"
