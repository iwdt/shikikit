# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Appears API
      #
      # @see https://shikimori.one/api/doc/1.0/appear Shikimori's API documentation
      module Appear
        # Mark comments or topics as read
        #
        # @param comment_ids [Array<#to_s>] Comment ids
        # @param topic_ids [Array<#to_s>] Topic ids
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if mark comments or topics as read successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/appear/create Shikimori's API documentation
        # @example Mark comment 7, 8 and topic 270101 as read
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_appear(ids: ["comment-7", "comment-8","topic-270101"]) #=> true
        def create_appear(comment_ids: [], topic_ids: [], headers: nil, **query)
          comments = comment_ids.map { "comment-#{_1}" }
          topics = topic_ids.map { "topic-#{_1}" }

          ids = comments + topics

          rest.post base_url.join('appear').url, { ids: ids.join(',') }, headers: headers, query: query

          true
        end
      end
    end
  end
end
