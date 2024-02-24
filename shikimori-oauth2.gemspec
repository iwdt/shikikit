# frozen_string_literal: true

require_relative 'lib/shikimori/oauth2/version'

Gem::Specification.new do |spec|
  spec.name = 'shikimori-oauth2'
  spec.version = Shikimori::OAuth2::VERSION
  spec.authors = ['Ivan Naumov']
  spec.email = ['ivannaymov@gmail.com']

  spec.summary = 'Simple wrapper for the Shikimori OAuth2'
  spec.description = 'Ruby toolkit for working with the Shikimori OAuth2'
  spec.homepage = 'https://github.com/iwdt/shikikit'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['source_code_uri'] = 'https://github.com/iwdt/shikikit'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/iwdt/shikikit/issues'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir[
    # Common files
    'LICENSE',
    'README.md',
    'shikimori-oauth2.gemspec',
    # Code
    'lib/shikimori-oauth2.rb',
    'lib/shikimori/oauth2.rb',
    'lib/shikimori/oauth2/**/*',
    # Signtures
    'sig/shikimori/oauth2.rbs',
    'sig/shikimori/oauth2/**/*'
  ]
  spec.bindir = 'bin'
  spec.executables = []
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'oauth2', '~> 2.0.0'
end
