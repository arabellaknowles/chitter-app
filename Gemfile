# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

group :test do
  gem 'rspec'
  gem 'rubocop', '0.79.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'capybara'
end

group :development do
  gem 'pg'
  gem 'sinatra'
  gem 'sinatra-flash'
  gem 'bcrypt'
end