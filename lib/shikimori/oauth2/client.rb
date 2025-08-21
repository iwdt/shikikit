# frozen_string_literal: true

module Shikimori
  module OAuth2
    # Client for Shikimori OAuth2
    class Client < ::OAuth2::Client
      SCOPE_JOIN_SYMBOL = '+'
      SCOPE_JOIN_ENCODED_SYMBOL = '%2B'

      def initialize(
        client_id,
        client_secret,
        options = {},
        app_name: config.app_name,
        &block
      )
        options = config.options.merge(options)

        @app_name = app_name

        super(client_id, client_secret, options, &block)
      end

      def authorize_url(params = {})
        # Shikimori only works with `+` sign, not encoded value
        super.gsub(SCOPE_JOIN_ENCODED_SYMBOL, SCOPE_JOIN_SYMBOL)
      end

      def get_token(params, access_token_opts = {}, extract_access_token = nil, &block)
        params[:headers] ||= {}
        params[:headers]['User-Agent'] ||= @app_name

        super
      end

      def config
        @config ||= OAuth2.config
      end
    end
  end
end
