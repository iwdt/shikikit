# frozen_string_literal: true

module Shikimori
  module API
    class V2
      # Methods for the User ignores API
      #
      # @see https://shikimori.one/api/doc/2.0/User%20Ignore Shikimori's API documentation
      module UserIgnore
        # Add user to ignore by id.
        # Requires `ignores` oauth scope
        #
        # @param user_id [#to_s] User id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created user ignore
        #
        # @see https://shikimori.one/api/doc/2.0/User%20Ignore/create Shikimori's API documentation
        # @example Add to ignore a user with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v2.create_user_ignore(1)
        def create_user_ignore(user_id, headers: nil, **query)
          rest.post base_url.join('users', user_id.to_s, 'ignore').url, {}, headers: headers, query: query
        end

        # Delete a user ignore by id.
        # Requires `ignores` oauth scope
        #
        # @param user_id [#to_s] User id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/2.0/User%20Ignore/destroy Shikimori's API documentation
        # @example Delete a user ignore
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v2.delete_user_ignore(1)
        def delete_user_ignore(user_id, headers: nil, **query)
          rest.delete base_url.join('users', user_id.to_s, 'ignore').url, headers: headers, query: query
        end
      end
    end
  end
end
