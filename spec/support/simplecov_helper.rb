# frozen_string_literal: true

require 'simplecov'

if ENV['CI']
  require 'simplecov-lcov'

  SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
  SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
end

SimpleCov.start do
  add_group 'API', ['lib/shikimori-api.rb', 'lib/shikimori/api.rb', 'lib/shikimori/api']
  add_group 'OAuth2', ['lib/shikimori-oauth2.rb', 'lib/shikimori/oauth2.rb', 'lib/shikimori/oauth2']
  add_group 'OmniAuth Strategy', ['lib/omniauth']

  add_filter ['/spec/', '/sig/']
end
