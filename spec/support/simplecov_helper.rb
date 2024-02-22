# frozen_string_literal: true

require 'simplecov'
require 'simplecov-cobertura'

SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter if ENV['CI']

SimpleCov.start do
  add_group 'API', ['lib/shikimori-api.rb', 'lib/shikimori/api.rb', 'lib/shikimori/api']
  add_group 'OAuth2', ['lib/shikimori-oauth2.rb', 'lib/shikimori/oauth2.rb', 'lib/shikimori/oauth2']
  add_group 'OmniAuth Strategy', ['lib/omniauth']

  add_filter ['/spec/', '/sig/']
end
