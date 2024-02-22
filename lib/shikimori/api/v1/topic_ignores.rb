# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Topic ignores API
      #
      # @deprecated Use {Shikimori::API::V2::TopicIgnore} instead
      #
      # @see https://shikimori.one/api/doc/1.0/topic_ignores Shikimori's API documentation
      module TopicIgnores
        # Add user to ignore at topic by user id and topic id.
        # Requires `topics` oauth scope
        #
        # @param topic_id [Integer] Topic id where to add
        # @param user_id [Integer] User id that add to ignores
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created topic ignore
        #
        # @see https://shikimori.one/api/doc/1.0/topic_ignores/create Shikimori's API documentation
        # @example Add to ignore a user with id equal to 1 at topic with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_topic_ignore(topic_id: 1, user_id: 1)
        #
        # @deprecated Use {Shikimori::API::V2::TopicIgnore#create_topic_ignore} instead
        def create_topic_ignore(topic_id:, user_id:, headers: nil, **query)
          payload = { topic_ignore: { topic_id: topic_id, user_id: user_id } }

          rest.post base_url.join('topic_ignores').url, payload, headers: headers, query: query
        end

        # Delete a user from topic ignores by id.
        # Requires `ignores` oauth scope
        #
        # @param id [#to_s] Topic ignore id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/topic_ignores/destroy Shikimori's API documentation
        # @example Delete a topic ignore
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_topic_ignore(1)
        #
        # @deprecated Use {Shikimori::API::V2::TopicIgnore#delete_topic_ignore} instead
        def delete_topic_ignore(id, headers: nil, **query)
          rest.delete base_url.join('topic_ignores', id.to_s).url, headers: headers, query: query
        end
      end
    end
  end
end
