# frozen_string_literal: true

require_relative 'lib/omniauth/shikimori/version'

Gem::Specification.new do |spec|
  spec.name = 'omniauth-shikimori-oauth2'
  spec.version = OmniAuth::Shikimori::VERSION
  spec.authors = ['Ivan Naumov']
  spec.email = ['ivannaymov@gmail.com']

  spec.summary = 'OmnAuth strategy for Shikimori'
  spec.description = 'Strategy to authenticate with Shikimori via OAuth2 in OmniAuth.'
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
    'omniauth-shikimori-oauth2.gemspec',
    # Code
    'lib/omniauth-shikimori-oauth2.rb',
    'lib/omniauth/**/*',
    # Signatures
    'sig/omniauth/**/*'
  ]
  spec.bindir = 'bin'
  spec.executables = []
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '~> 1.8'
  spec.add_dependency 'shikimori-oauth2'
end
