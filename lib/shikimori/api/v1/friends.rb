# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Friends API
      #
      # @see https://shikimori.one/api/doc/1.0/friends Shikimori's API documentation
      module Friends
        # Create friend by user_id.
        # Requires `friends` oauth scope
        #
        # @param user_id [#to_s] User id that add to friends
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if added to friends
        #
        # @see https://shikimori.one/api/doc/1.0/friends/create Shikimori's API documentation
        # @example Add to friends a user with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_friend(1)
        def create_friend(user_id, headers: nil, **query)
          rest.post base_url.join('friends', user_id.to_s).url, {}, headers: headers, query: query

          true
        end

        # Delete friend by user id.
        # Requires `friends` oauth scope
        #
        # @param user_id [#to_s] Friend id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/friends/destroy Shikimori's API documentation
        # @example Delete a user from friends by id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #
        #   client.v1.delete_friend(1)
        def delete_friend(user_id, headers: nil, **query)
          rest.delete base_url.join('friends', user_id.to_s).url, headers: headers, query: query
        end
      end
    end
  end
end
