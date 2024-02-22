# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Stats API
      #
      # @see https://shikimori.one/api/doc/1.0/stats Shikimori's API documentation
      module Stats
        # Get list of active users
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Integer>] Array of ids of active users
        #
        # @see https://shikimori.one/api/doc/1.0/stats/active_users Shikimori's API documentation
        # @example Get list of active users
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.active_users #=> [1, 2, 3, ...]
        def active_users(headers: nil, **query)
          rest.get base_url.join('stats', 'active_users').url, headers: headers, query: query
        end
      end
    end
  end
end
