require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require 'capybara/rspec'
require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')

Capybara.app = Chitter