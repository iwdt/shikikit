# frozen_string_literal: true

module Shikimori
  module API
    class V2
      # Methods for the Topic ignores API
      #
      # @see https://shikimori.one/api/doc/2.0/Topic%20Ignore Shikimori's API documentation
      module TopicIgnore
        # Add topic to ignore by id.
        # Requires `topics` oauth scope
        #
        # @param topic_id [#to_s] Topic id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created topic ignore
        #
        # @see https://shikimori.one/api/doc/2.0/Topic%20Ignore/create Shikimori's API documentation
        # @example Add to ignore a topic with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v2.create_topic_ignore(1)
        def create_topic_ignore(topic_id, headers: nil, **query)
          rest.post base_url.join('topics', topic_id.to_s, 'ignore').url, {}, headers: headers, query: query
        end

        # Delete a topic ignore by id.
        # Requires `ignores` oauth scope
        #
        # @param topic_id [#to_s] Topic id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/2.0/Topic%20Ignore/destroy Shikimori's API documentation
        # @example Delete a topic ignore
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v2.delete_topic_ignore(1)
        def delete_topic_ignore(topic_id, headers: nil, **query)
          rest.delete base_url.join('topics', topic_id.to_s, 'ignore').url, headers: headers, query: query
        end
      end
    end
  end
end
