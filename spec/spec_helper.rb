# frozen_string_literal: true

Dir[File.expand_path('../spec/support/**/*.rb', __dir__)].each { require _1 }

require 'shikimori-oauth2'
require 'shikimori-api'
require 'omniauth-shikimori-oauth2'

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/.status'
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Rack::Test::Methods
  config.extend OmniAuth::Test::StrategyMacros, type: :strategy
end
