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

      def initialize(site = DEFAULT_SITE_URL, app_name:, access_token:, refresh_token:)
        rest = REST.new(
          access_token: access_token,
          refresh_token: refresh_token,
          app_name: app_name
        )
        @v1 = V1.new(
          base_url: URI.new(site).join('api/'),
          rest: rest
        )
        @v2 = V2.new(
          base_url: URI.new(site).join('api/v2/'),
          rest: rest
        )
      end
    end
  end
end
