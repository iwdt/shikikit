# frozen_string_literal: true

module Shikimori
  module OAuth2
    # Configuration for Shikimori OAuth2 client
    class Config
      DEFAULT_SITE_URL = 'https://shikimori.one/'
      DEFAULT_APP_NAME = 'Api Test'

      attr_accessor :options, :site, :app_name

      def initialize(site: DEFAULT_SITE_URL, app_name: DEFAULT_APP_NAME, **options)
        @app_name = app_name
        @options = { site: site }.merge(options)
      end
    end
  end
end
