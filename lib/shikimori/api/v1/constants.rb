# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Constants API
      #
      # @see https://shikimori.one/api/doc/1.0/constants Shikimori's API documentation
      module Constants
        # Get anime constants
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing constants
        #
        # @see https://shikimori.one/api/doc/1.0/constants/anime Shikimori's API documentation
        # @example Get anime constants
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime_constants #=> { kind: [...], status: [...] }
        def anime_constants(headers: nil, **query)
          rest.get base_url.join('constants', 'anime').url, headers: headers, query: query
        end

        # Get manga constants
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing constants
        #
        # @see https://shikimori.one/api/doc/1.0/constants/manga Shikimori's API documentation
        # @example Get manga constants
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.manga_constants #=> { kind: [...], status: [...] }
        def manga_constants(headers: nil, **query)
          rest.get base_url.join('constants', 'manga').url, headers: headers, query: query
        end

        # Get user rate constants
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing constants
        #
        # @see https://shikimori.one/api/doc/1.0/constants/user_rate Shikimori's API documentation
        # @example Get user_rate constants
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_rate_constants #=> { status: [...] }
        def user_rate_constants(headers: nil, **query)
          rest.get base_url.join('constants', 'user_rate').url, headers: headers, query: query
        end

        # Get club constants
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing constants
        #
        # @see https://shikimori.one/api/doc/1.0/constants/club Shikimori's API documentation
        # @example Get club constants
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club_constants #=> { join_policy: [...], comment_policy: [...], image_upload_policy: [...] }
        def club_constants(headers: nil, **query)
          rest.get base_url.join('constants', 'club').url, headers: headers, query: query
        end

        # Get list of smileys constants
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing constants
        #
        # @see https://shikimori.one/api/doc/1.0/constants/smileys Shikimori's API documentation
        # @example Get smileys constants
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.smileys_constants #=> [{ bbcode: '...', path: '...' }, ...]
        def smileys_constants(headers: nil, **query)
          rest.get base_url.join('constants', 'smileys').url, headers: headers, query: query
        end
      end
    end
  end
end
