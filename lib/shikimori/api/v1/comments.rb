# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Comments API
      #
      # @see https://shikimori.one/api/doc/1.0/comments Shikimori's API documentation
      module Comments
        # Get list of comments
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of comments per page. Must be a lower or equal that 30
        # @option query [1, 0] :desc Sorting direction
        # @option query [Integer] :commentable_id ID of object to comments requested
        # @option query ['Topic', 'User'] :commentable_type Type of object to comments requested
        #
        # @return [Array<Hash>] Array of hashes representing comments
        #
        # @raise [Shikimori::API::NotFoundError] if commentable not exists
        # @raise [Shikimori::API::RequestError] if commentable not sended
        #
        # @see https://shikimori.one/api/doc/1.0/comments/index Shikimori's API documentation
        # @example Get a 10 comments for topic with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.comments(commentable_id: 1, commentable_type: 'Topic', limit: 10) #=> [{ id: 1, ... }, ...
        def comments(headers: nil, **query)
          rest.get base_url.join('comments').url, headers: headers, query: query
        end

        # Get a comment by id
        #
        # @param id [#to_s] Comment id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing comment
        #
        # @raise [Shikimori::API::NotFoundError] if comment not exists
        #
        # @see https://shikimori.one/api/doc/1.0/comments/show Shikimori's API documentation
        # @example Get a comment with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.comment(1) #=> { id: 1, ... }
        def comment(id, headers: nil, **query)
          rest.get base_url.join('comments', id.to_s).url, headers: headers, query: query
        end

        # Create a comment
        # Requires `comments` oauth scope
        #
        # @param comment [Hash] Comment data for creating
        # @option comment [String] :body Comment text
        # @option comment [Integer] :commentable_id ID of object to comment
        # @option comment ['Topic', 'User', 'Anime',
        #   'Manga', 'Character', 'Person',
        #   'Article', 'Club', 'ClubPage',
        #   'Collection', 'Critique', 'Review'] :commentable_type Type of object to comment
        # @option comment ['true', 'false', 1, 0] :is_offtopic Mark comment as offtopic
        # @param broadcast ['false', 'true', 1, 0] Used to broadcast
        #   comment in club’s topic. Only club admins can broadcast.
        # @param frontend ['false', 'true', 1, 0] Used by shikimori frontend code. Ignore it.
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created comment
        #
        # @raise [Shikimori::API::RequestError] if bad request data
        # @raise [Shikimori::API::NotFoundError] if commentable not exists
        #
        # @see https://shikimori.one/api/doc/1.0/comments/create Shikimori's API documentation
        # @example Create a comment for topic with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_comment({ body: 'Hello, kitty! :)', commentable_type: 'Topic', commentable_id: 1 })
        def create_comment(comment, broadcast: nil, frontend: nil, headers: nil, **query)
          rest.post(
            base_url.join('comments').url,
            { broadcast: broadcast, comment: comment, frontend: frontend }.compact,
            headers: headers, query: query
          )
        end

        # Update Comment.
        # Requires `comments` oauth scope.
        # Use {Shikimori::API::V2::AbuseRequests#abuse_offtopic_request} to change is_offtopic field.
        #
        # @param id [#to_s] Comment id
        # @param comment [Hash] Comment data for updating
        # @option comment [String] :body Comment text
        # @option comment [Integer] :commentable_id ID of object to comment
        # @option comment ['Topic', 'User', 'Anime',
        #   'Manga', 'Character', 'Person',
        #   'Article', 'Club', 'ClubPage',
        #   'Collection', 'Critique', 'Review'] :commentable_type Type of object to comment
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query ['false', 'true', 1, 0] :broadcast Used to broadcast
        #   comment in club’s topic. Only club admins can broadcast.
        # @option query ['false', 'true', 1, 0] :frontend Used by shikimori frontend code. Ignore it.
        #
        # @return [Hash] Hash representing updated comment
        #
        # @raise [Shikimori::API::RequestError] if bad request data
        # @raise [Shikimori::API::NotFoundError] if comment not exists
        #
        # @see https://shikimori.one/api/doc/1.0/comments/update Shikimori's API documentation
        # @example Update a comment's text with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.update_comment(1, { body: "new text!" })
        def update_comment(id, comment, headers: nil, **query)
          rest.put(
            base_url.join('comments', id.to_s).url,
            { broadcast: query.delete(:broadcast), comment: comment, frontend: query.delete(:frontend) }.compact,
            headers: headers, query: query
          )
        end

        # Delete Comment.
        # Requires `comments` oauth scope
        #
        # @param id [String, Integer] Comment id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @raise [Shikimori::API::NotFoundError] if comment not exists
        #
        # @see https://shikimori.one/api/doc/1.0/comments/destroy Shikimori's API documentation
        # @example Delete a comment with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_comment(1)
        def delete_comment(id, headers: nil, **query)
          rest.delete base_url.join('comments', id.to_s).url, headers: headers, query: query
        end
      end
    end
  end
end
