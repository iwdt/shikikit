# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Forums API
      #
      # @see https://shikimori.one/api/doc/1.0/forums Shikimori's API documentation
      module Forums
        # Get list of Forums
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing forums
        #
        # @see https://shikimori.one/api/doc/1.0/forums/index Shikimori's API documentation
        # @example Get list of forums
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.forums #=> [{ id: 1, ... }, ...]
        def forums(headers: nil, **query)
          rest.get base_url.join('forums').url, headers: headers, query: query
        end
      end
    end
  end
end
