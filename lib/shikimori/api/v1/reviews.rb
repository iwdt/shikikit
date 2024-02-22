# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Reviews API
      #
      # @see https://shikimori.one/api/doc/1.0/reviews Shikimori's API documentation
      module Reviews
        # Create a anime's review
        #
        # @param review [Hash] Review data for creating
        # @option review [String] :body Review text
        # @option review [Integer] :anime_id Anime's ID
        # @option review ['positive', 'neutral', 'negative'] :opinion Review's opinion
        # @param frontend ['false', 'true', 1, 0] Used by shikimori frontend code. Ignore it.
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created comment
        #
        # @see https://shikimori.one/api/doc/1.0/reviews/create Shikimori's API documentation
        # @example Create a comment for topic with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_review({ body: 'Good!', anime_id: 1, opinion: 'positive' })
        def create_review(review, frontend: nil, headers: nil, **query)
          rest.post(
            base_url.join('reviews').url,
            { review: review, frontend: frontend }.compact,
            headers: headers, query: query
          )
        end

        # Update anime's review by id
        #
        # @param id [Hash] Review's id
        # @param review [Hash] Review data for updating
        # @option review [String] :body Review text
        # @option review ['positive', 'neutral', 'negative'] :opinion Review's opinion
        # @param frontend ['false', 'true', 1, 0] Used by shikimori frontend code. Ignore it.
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing updated review
        #
        # @see https://shikimori.one/api/doc/1.0/reviews/update Shikimori's API documentation
        # @example Change review opinion
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #
        #   client.v1.update_review(1, { opinion: 'negative' })
        def update_review(id, review, frontend: nil, headers: nil, **query)
          rest.put(
            base_url.join('reviews', id.to_s).url,
            { review: review, frontend: frontend }.compact,
            headers: headers, query: query
          )
        end

        # Delete anime's review
        #
        # @param id [String, Integer] Review id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/reviews/destroy
        # @example Delete review with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_review(1)
        def delete_review(id, headers: nil, **query)
          rest.delete base_url.join('reviews', id.to_s).url, headers: headers, query: query
        end
      end
    end
  end
end
