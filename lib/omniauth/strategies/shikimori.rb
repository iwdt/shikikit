# frozen_string_literal: true

module OmniAuth
  module Strategies
    # OmnAuth strategy for Shikimori
    #
    # @see https://github.com/omniauth/omniauth-oauth2 Official repository for OmniAuth OAuth2
    class Shikimori < OAuth2
      USER_INFO_PATH = 'api/users/whoami'

      option :name, :shikimori
      option :client_options, site: ::Shikimori::OAuth2::Config::DEFAULT_SITE_URL
      option :app_name, ::Shikimori::OAuth2::Config::DEFAULT_APP_NAME

      uid { raw_info['id'] }

      info do
        {
          nickname: raw_info['nickname'],
          name: raw_info['name'],
          gender: raw_info['sex'],
          locale: raw_info['locale'],
          avatar_url: raw_info['avatar'],
          website: raw_info['website'],
          birthday: raw_info['birth_on'],
          urls: { shikimori: raw_info['url'] }
        }
      end

      def client
        @client ||= ::Shikimori::OAuth2::Client.new(
          options.client_id,
          options.client_secret,
          deep_symbolize(options.client_options),
          app_name: options.app_name
        )
      end

      def raw_info
        @raw_info ||= access_token.get(info_uri).parsed
      end

      private

      def info_uri
        URI.join(client.site, USER_INFO_PATH)
      end
    end
  end
end
