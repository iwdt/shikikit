# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Ignores API
      #
      # @deprecated Use {Shikimori::API::V2::UserIgnore} instead
      #
      # @see https://shikimori.one/api/doc/1.0/ignores Shikimori's API documentation
      module Ignores
        # Add user to ignore by user id.
        # Requires `ignores` oauth scope
        #
        # @param user_id [#to_s] User id that add to ignores
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created user ignore
        #
        # @see https://shikimori.one/api/doc/1.0/ignores/create Shikimori's API documentation
        # @example Add to ignore a user with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_ignore(1)
        #
        # @deprecated Use {Shikimori::API::V2::UserIgnore#create_user_ignore} instead
        def create_ignore(user_id, headers: nil, **query)
          rest.post base_url.join('ignores', user_id.to_s).url, {}, headers: headers, query: query

          true
        end

        # Delete a user from ignores by user id.
        # Requires `ignores` oauth scope
        #
        # @param user_id [#to_s] User id that remove from ignores
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/ignores/destroy Shikimori's API documentation
        # @example Delete a ignore
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_ignore(1)
        #
        # @deprecated Use {Shikimori::API::V2::UserIgnore#delete_user_ignore} instead
        def delete_ignore(user_id, headers: nil, **query)
          rest.delete base_url.join('ignores', user_id.to_s).url, headers: headers, query: query
        end
      end
    end
  end
end
