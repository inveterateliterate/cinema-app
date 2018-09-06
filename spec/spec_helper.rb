ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    Rails.application.load_seed
  end

  Shoulda::Matchers.configure do |c|
    c.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end