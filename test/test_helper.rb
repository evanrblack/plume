ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Concern tests
Dir[File.dirname(__FILE__) + '/models/concerns/*.rb'].each do |file|
  require file
end

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml
    # for all tests in alphabetical order.
    fixtures :all
    # Add more helper methods to be used by all tests here...

    def self.must_validate_presence(model, params)
      params.each do |field, value|
        it "must have a #{field.to_s.humanize(capitalize: false)}" do
          model.send("#{field}=", nil)
          model.validate
          model.errors.keys.must_include field
          model.send("#{field}=", value)
          model.validate
          model.errors.keys.wont_include field
        end
      end
    end
  end
end

module ActionDispatch
  class IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end
