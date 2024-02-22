# frozen_string_literal: true

module Shikimori
  module API
    class V2
      # Methods for the Abuse requests API
      #
      # @see https://shikimori.one/api/doc/2.0/abuse_requests Shikimori's API documentation
      module AbuseRequests
        # Abuse offtopic request
        #
        # @param abuse_request [Hash] Abuse request data for creating
        # @option abuse_request [Integer] :comment_id Comment id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing abuse request
        #
        # @see https://shikimori.one/api/doc/2.0/abuse_requests/offtopic Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #              app_name: 'Api Test',
        #              aceess_token: '****',
        #              refresh_token: '****'
        #            )
        #   client.v2.abuse_offtopic_request({ comment_id: 1, topic_id: 1, reason: 'Nani?!' })
        def abuse_offtopic_request(abuse_request, headers: nil, **query)
          rest.post base_url.join('abuse_requests', 'offtopic').url, abuse_request.to_h, headers: headers, query: query
        end

        # Abuse review request
        #
        # @param abuse_request [Hash] Abuse request data for creating
        # @option abuse_request [Integer] :comment_id Comment id
        # @option abuse_request [Integer] :topic_id Comment id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing abuse request
        #
        # @see https://shikimori.one/api/doc/2.0/abuse_requests/convert_review Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #              app_name: 'Api Test',
        #              aceess_token: '****',
        #              refresh_token: '****'
        #            )
        #   client.v2.abuse_review_request({ topic_id: 1 })
        def abuse_review_request(abuse_request, headers: nil, **query)
          rest.post base_url.join('abuse_requests', 'convert_review').url,
                    abuse_request.to_h,
                    headers: headers, query: query
        end

        # Abuse abuse request
        #
        # @param abuse_request [Hash] Abuse request data for creating
        # @option abuse_request [Integer] :comment_id Comment id
        # @option abuse_request [Integer] :topic_id Comment id
        # @option abuse_request [String] :reason Reason to abuse
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing abuse request
        #
        # @see https://shikimori.one/api/doc/2.0/abuse_requests/abuse Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #              app_name: 'Api Test',
        #              aceess_token: '****',
        #              refresh_token: '****'
        #            )
        #   client.v2.abuse_request({ topic_id: 1, reason: 'Nani?!' })
        def abuse_request(abuse_request, headers: nil, **query)
          rest.post base_url.join('abuse_requests', 'abuse').url, abuse_request.to_h, headers: headers, query: query
        end

        # Abuse spoiler request
        #
        # @param abuse_request [Hash] Abuse request data for creating
        # @option abuse_request [Integer] :comment_id Comment id
        # @option abuse_request [Integer] :topic_id Comment id
        # @option abuse_request [String] :reason Reason to abuse
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing abuse request
        #
        # @see https://shikimori.one/api/doc/2.0/abuse_requests/spoiler Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #              app_name: 'Api Test',
        #              aceess_token: '****',
        #              refresh_token: '****'
        #            )
        #   client.v2.abuse_spoiler_request({ comment_id: 1, reason: 'Nani?!' })
        def abuse_spoiler_request(abuse_request, headers: nil, **query)
          rest.post base_url.join('abuse_requests', 'spoiler').url, abuse_request.to_h, headers: headers, query: query
        end
      end
    end
  end
end
