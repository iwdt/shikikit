# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Publishers API
      #
      # @see https://shikimori.one/api/doc/1.0/publishers Shikimori's API documentation
      module Publishers
        # Get list of publishers
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Array of hashes representing publishers
        #
        # @see https://shikimori.one/api/doc/1.0/publishers/index Shikimori's API documentation
        # @example Get list of publishers
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.publishers #=> [{ id: 1, ... }, ...]
        def publishers(headers: nil, **query)
          rest.get base_url.join('publishers').url, headers: headers, query: query
        end
      end
    end
  end
end
