# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Dialogs API
      #
      # @see https://shikimori.one/api/doc/1.0/dialogs Shikimori's API documentation
      module Dialogs
        # Get list of Dialogs.
        # Requires `messages` oauth scope
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of dialogs per page. Must be a lower or equal that 20
        #
        # @return [Array<Hash>] Array of hashes representing dialogs
        #
        # @see https://shikimori.one/api/doc/1.0/dialogs/index Shikimori's API documentation
        # @example Get list of dialogs
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.dialogs
        def dialogs(headers: nil, **query)
          rest.get base_url.join('dialogs').url, headers: headers, query: query
        end

        # Get a dialog by username.
        # Requires `messages` oauth scope
        #
        # @param username [#to_s] Dialog's username
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of dialogs per page. Must be a lower or equal that 20
        #
        # @return [Hash] Hash representing dialog
        #
        # @see https://shikimori.one/api/doc/1.0/dialogs/show Shikimori's API documentation
        # @example Get dialog with username equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.dialog('user_12') #=> [{ id: 1, ... }]
        def dialog(username, headers: nil, **query)
          rest.get base_url.join('dialogs', username.to_s).url, headers: headers, query: query
        end

        # Delete Dialog.
        # Requires `messages` oauth scope
        #
        # @param username [#to_s] Dialog's username
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/dialogs/destroy Shikimori's API documentation
        # @example Delete dialog with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_dialog('user_12') #=> true
        def delete_dialog(username, headers: nil, **query)
          rest.delete base_url.join('dialogs', username.to_s).url, headers: headers, query: query
        end
      end
    end
  end
end
