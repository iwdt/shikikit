# Shikikit
Ruby toolkit for the [Shikimori](https://shikimori.one)

[![CI](https://github.com/iwdt/shikikit/actions/workflows/main.yml/badge.svg)](https://github.com/iwdt/shikikit/actions/workflows/main.yml) [![codecov](https://codecov.io/gh/iwdt/shikikit/graph/badge.svg)](https://codecov.io/gh/iwdt/shikikit)

## Table of Contents
1. [API Documentation](#api-documentation)
2. [Omniauth Strategy](#omniauth-shikimori-strategy)
   1. [Installation](#installation)
   2. [Configuration](#configuration)
   3. [Usage](#usage)
3. [OAuth2](#shikimori-oauth-2)
   1. [Installation](#installation-1)
   2. [Configuration](#configuration-1)
   3. [Usage](#usage-1)
4. [API Client](#shikimori-api)
   1. [Installation](#installation-2)
   2. [Configuration](#configuration-2)
   3. [Usage](#usage-2)
5. [Supported Ruby Versions](#supported-ruby-versions)
6. [Versioning](#versioning)
7. [Contributing](/CONTRIBUTING.md)
8. [Code of conduct](/CODE_OF_CONDUCT.md)
9. [License](/LICENSE.txt)

## API Documentation

* [Shikimori API](https://www.rubydoc.info/gems/shikimori-api)
* [Shikimori OAuth2](https://www.rubydoc.info/gems/shikimori-oauth2)
* [Omniauth Shikimori Strategy](https://www.rubydoc.info/gems/omniauth-shikimori-oauth2)

## Omniauth Shikimori Strategy

Strategy to authenticate with Shikimori via OAuth2 in OmniAuth

[![Gem Version](https://badge.fury.io/rb/omniauth-shikimori-oauth2.svg)](https://rubygems.org/gems/omniauth-shikimori-oauth2)

### Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-shikimori-oauth2', '~> 1.0'
```

Then `bundle install`

### Configuration

TODO

### Usage

TODO

## Shikimori OAuth 2

A Ruby wrapper for the [Shikimori's OAuth 2](https://shikimori.one/oauth)

[![Gem Version](https://badge.fury.io/rb/shikimori-oauth2.svg)](https://rubygems.org/gems/shikimori-oauth2)


### Installation

Install via Rubygems

```bash
gem install shikimori-oauth2
```

... or add to your Gemfile

```ruby
gem 'shikimori-oauth2', '~> 1.0'
```

Access the library in Ruby:

```ruby
require 'shikimori-oauth2'
```

### Configuration

TODO

### Usage

TODO

## Shikimori API

Simple wrapper for the Shikimori API

[![Gem Version](https://badge.fury.io/rb/shikimori-api.svg)](https://rubygems.org/gems/shikimori-api)

### Installation

Install via Rubygems

```bash
gem install shikimori-api
```

... or add to your Gemfile

```ruby
gem 'shikimori-api', '~> 1.0'
```

Access the library in Ruby:

```ruby
require 'shikimori-api'
```

### Configuration

TODO

### Usage

TODO

## Supported Ruby Versions
This library aims to support and is tested against the following Ruby implementations:
* Ruby 3.0
* Ruby 3.1
* Ruby 3.2
* Ruby 3.3

If something doesn't work on one of these Ruby versions, it's a bug.

This library may inadvertently work (or seem to work) on other Ruby implementations, but support will only be provided for the versions listed above.

If you would like this library to support another Ruby version, you may volunteer to be a maintainer. Being a maintainer entails making sure all tests run and pass on that implementation. When something breaks on your implementation, you will be responsible for providing patches in a timely fashion. If critical issues for a particular implementation exist at the time of a major release, support for that Ruby version may be dropped.

## Versioning
This library aims to adhere to [Semantic Versioning 2.0.0](http://semver.org/). Violations of this scheme should be reported as bugs. Specifically, if a minor or patch version is released that breaks backward compatibility, that version should be immediately yanked and/or a new version should be immediately released that restores compatibility. Breaking changes to the public API will only be introduced with new major versions. As a result of this policy, you can (and should) specify a dependency on this gem using the Pessimistic Version Constraint with two digits of precision.
