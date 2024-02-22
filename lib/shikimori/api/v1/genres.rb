# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Genres API
      #
      # @see https://shikimori.one/api/doc/1.0/genres Shikimori's API documentation
      module Genres
        # Get list of genres
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing genres
        #
        # @see https://shikimori.one/api/doc/1.0/genres/index Shikimori's API documentation
        # @example Get list of genres
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.genres #=> [{ id: 1, ... }, ...]
        def genres(headers: nil, **query)
          rest.get base_url.join('genres').url, headers: headers, query: query
        end
      end
    end
  end
end
