# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Bans API
      #
      # @see https://shikimori.one/api/doc/1.0/bans Shikimori's API documentation
      module Bans
        # Get list of bans
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing bans
        #
        # @see https://shikimori.one/api/doc/1.0/bans/index Shikimori's API documentation
        # @example Get list of bans
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.bans #=> [{ id: 1, ... }, { id: 2, ... }]
        def bans(headers: nil, **query)
          rest.get base_url.join('bans').url, headers: headers, query: query
        end
      end
    end
  end
end
