# frozen_string_literal: true

source 'https://rubygems.org'

gemspec name: 'shikimori-api'
gemspec name: 'shikimori-oauth2'
gemspec name: 'omniauth-shikimori-oauth2'

group :development, :test do
  gem 'dotenv'

  gem 'rake'

  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false

  gem 'steep', require: false
  gem 'typeprof', require: false
end

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem 'simplecov'
  gem 'simplecov-lcov'
  gem 'vcr'
  gem 'webmock'
end
