# frozen_string_literal: true

require_relative 'rest'
require_relative 'uri'
require_relative 'v1'
require_relative 'v2'

module Shikimori
  module API
    # Client to call shikimoris API
    class Client
      # @return [String] Default site url
      DEFAULT_SITE_URL = 'https://shikimori.one/'

      attr_reader :v1, :v2

      # Initialize a Shikimori's API Client
      #
      # @param site [String] Shikimori's base url
      # @param options [Hash] Additional options to making requests to shikimori
      # @option options [String] :app_name OAuth2 application name
      # @option options [String] :access_token User's access token from OAuth2
      # @option options [String] :refresh_token User's refresh token from OAuth2
      # @option options [String] :proxy_host Proxy hostname
      # @option options [Integer] :proxy_port Proxy port
      # @option options [String] :proxy_user Proxy username
      # @option options [String] :proxy_password Proxy password
      def initialize(site = DEFAULT_SITE_URL, **options)
        rest = REST.new(**options)
        base_uri = URI.new(site)

        @v1 = V1.new(base_url: base_uri.join('api/'), rest: rest)
        @v2 = V2.new(base_url: base_uri.join('api/v2/'), rest: rest)
      end
    end
  end
end
