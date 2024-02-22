# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<APP_NAME>') { 'Api Test' }
  config.filter_sensitive_data('<ACCESS_TOKEN>') { 'FAKE-ACCESS-TOKEN' }
  config.filter_sensitive_data('<REFRESH_TOKEN>') { 'FAKE-REFRESH-TOKEN' }
end
