# frozen_string_literal: true

require 'oauth2'

require_relative 'oauth2/config'
require_relative 'oauth2/client'

module Shikimori
  # Tools for Shikimori OAuth2
  #
  # @see https://shikimori.one/oauth Official documentation
  module OAuth2
    class << self
      def config
        @config ||= Config.new
      end

      def configure
        yield(config)
      end
    end
  end
end
