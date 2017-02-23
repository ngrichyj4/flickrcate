require 'spec_helper'
require 'rails_helper'
# Add this to load Capybara integration:
require 'capybara/rspec'
require 'capybara/rails'
# Uncomment the following line to use selenium-webdriver for specs so you can watch them in browser
Capybara.javascript_driver = :webkit
Capybara.default_max_wait_time = 15
Capybara.app_host = 'localhost:3000'
Capybara::Webkit.configure do |config|
  config.allow_url("staticflickr.com")
end