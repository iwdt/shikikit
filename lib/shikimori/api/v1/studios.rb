# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Studios API
      #
      # @see https://shikimori.one/api/doc/1.0/studios Shikimori's API documentation
      module Studios
        # Get list of studios
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing studios
        #
        # @see https://shikimori.one/api/doc/1.0/studios/index Shikimori's API documentation
        # @example Get list of studios
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.studios #=> [{ id: 1, ... }, ...]
        def studios(headers: nil, **query)
          rest.get base_url.join('studios').url, headers: headers, query: query
        end
      end
    end
  end
end
