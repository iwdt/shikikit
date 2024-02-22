# frozen_string_literal: true

require_relative 'lib/shikimori/api/version'

Gem::Specification.new do |spec|
  spec.name = 'shikimori-api'
  spec.version = Shikimori::API::VERSION
  spec.authors = ['Ivan Naumov']
  spec.email = ['ivannaymov@gmail.com']

  spec.summary = 'Simple wrapper for the Shikimori API'
  spec.description = 'Ruby toolkit for working with the Shikimori API'
  spec.homepage = 'https://github.com/iwdt/shikikit'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  spec.metadata['source_code_uri'] = 'https://github.com/iwdt/shikikit'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/iwdt/shikikit/issues'
  spec.metadata['changelog_uri'] = 'https://github.com/iwdt/shikikit/blob/main/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir[
    # Common files
    'LICENSE',
    'README.md',
    'shikimori-api.gemspec',
    # Code
    'lib/shikimori-api.rb',
    'lib/shikimori/api.rb',
    'lib/shikimori/api/**/*',
    # Signtures
    'sig/shikimori/api.rbs',
    'sig/shikimori/api/**/*'
  ]
  spec.bindir = 'bin'
  spec.executables = []
  spec.require_paths = ['lib']
end
