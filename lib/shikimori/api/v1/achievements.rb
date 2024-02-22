# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Achievements API
      #
      # @see https://shikimori.one/api/doc/1.0/achievements Shikimori's API documentation
      module Achievements
        # Get list of Achievements
        #
        # @param user_id [Integer] User's ID
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing user's achievements
        #
        # @see https://shikimori.one/api/doc/1.0/achievements/index Shikimori's API documentation
        # @example Get a achievements for user with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.achievements(user_id: 1) #=> [{ id: 1, ... }]
        def achievements(user_id:, headers: nil, **query)
          rest.get base_url.join('achievements').url, headers: headers, query: { user_id: user_id }.merge(query)
        end
      end
    end
  end
end
