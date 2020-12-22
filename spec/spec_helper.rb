require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['ENVIRONMENT'] = 'test'

require 'capybara/rspec'
require 'pg'
require 'support/database_truncator.rb'
require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
