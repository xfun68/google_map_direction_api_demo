require 'cucumber/rails'

require "capybara/cucumber"
require "capybara/session"

Capybara.default_selector = :css

Capybara.default_driver = :selenium

ActionController::Base.allow_rescue = false

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end
