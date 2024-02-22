# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Messages API
      #
      # @see https://shikimori.one/api/doc/1.0/messages Shikimori's API documentation
      module Messages
        # Get a message by id.
        #
        # Requires `messages` oauth scope
        # @param id [#to_s] message id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing message
        #
        # @see https://shikimori.one/api/doc/1.0/messages/show Shikimori's API documentation
        # @example Get a message with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.message(1) #=> { id: 1, ... }
        def message(id, headers: nil, **query)
          rest.get base_url.join('messages', id.to_s).url, headers: headers, query: query
        end

        # Create a message
        # Requires `messages` oauth scope
        #
        # @param message [Hash] Message data for creating
        # @option message [String] :body message text
        # @option message [Integer] :from_id user id, that sending a message
        # @option message [Integer] :to_id user id, that receiving a message
        # @option message ['Private'] :kind message type
        # @param frontend ['false', 'true', 1, 0] Used by shikimori frontend code. Ignore it.
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created message
        #
        # @see https://shikimori.one/api/doc/1.0/messages/create Shikimori's API documentation
        # @example Send message by user with id 1 to user with 2
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_message({ body: 'Hello, kitty! :)', from_id: 1, to_id: 2, kind: 'Private' })
        def create_message(message, frontend: nil, headers: nil, **query)
          rest.post(
            base_url.join('messages').url,
            { message: message, frontend: frontend }.compact,
            headers: headers, query: query
          )
        end

        # Update message.
        # Requires `messages` oauth scope
        #
        # @param id [#to_s] message id
        # @param message [Hash] message data for updating
        # @option message [String] :body message text
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query ['false', 'true', 1, 0] :frontend Used by shikimori frontend code. Ignore it.
        #
        # @return [Hash] Hash representing updated message
        #
        # @see https://shikimori.one/api/doc/1.0/messages/update Shikimori's API documentation
        # @example Update a message's text with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.update_message(1, { body: "new text!" })
        def update_message(id, message, headers: nil, **query)
          rest.put(
            base_url.join('messages', id.to_s).url,
            { message: message, frontend: query.delete(:frontend) }.compact,
            headers: headers, query: query
          )
        end

        # Delete message.
        # Requires `messages` oauth scope
        #
        # @param id [String, Integer] message id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/messages/destroy Shikimori's API documentation
        # @example Delete a message with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_message(1)
        def delete_message(id, headers: nil, **query)
          rest.delete base_url.join('messages', id.to_s).url, headers: headers, query: query
        end

        # Mark all messages as read by type
        # Requires `messages` oauth scope
        #
        # @param type ['news', 'notifications'] Type of messages to read
        # @param frontend ['false', 'true', 1, 0] Used by shikimori frontend code. Ignore it.
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing of readed messages
        #
        # @see https://shikimori.one/api/doc/1.0/messages/read_all Shikimori's API documentation
        # @example Read all notifications
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.read_all_messages(type: 'notifications')
        def read_all_messages(type:, frontend: nil, headers: nil, **query)
          rest.post(
            base_url.join('messages', 'read_all').url,
            { type: type, frontend: frontend }.compact,
            headers: headers, query: query
          )

          true
        end

        # Delete all messages by type
        # Requires `messages` oauth scope
        #
        # @param type ['news', 'notifications'] Type of messages to delete
        # @param frontend ['false', 'true', 1, 0] Used by shikimori frontend code. Ignore it.
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing of deleted messages
        #
        # @see https://shikimori.one/api/doc/1.0/messages/delete_all Shikimori's API documentation
        # @example Delete all notifications
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_all_messages(type: 'notifications')
        def delete_all_messages(type:, frontend: nil, headers: nil, **query)
          rest.post(
            base_url.join('messages', 'delete_all').url,
            { type: type, frontend: frontend }.compact,
            headers: headers, query: query
          )

          true
        end
      end
    end
  end
end
