# frozen_string_literal: true

module Shikimori
  module API
    class V2
      # Methods for the Episode notifications API
      #
      # @see https://shikimori.one/api/doc/2.0/episode_notifications Shikimori's API documentation
      module EpisodeNotifications
        # Notify shikimori about anime episode release
        #
        # @param episode_notification [Hash] Episode notification data for creating
        # @option episode_notification [Integer] :anime_id Anime id
        # @option episode_notification [Integer] :episode Episode number
        # @option episode_notification [String] :aired_at Date and time of aired
        # @option episode_notification ['true', 'false', 1, 0] :is_fandub Is fandub?
        # @option episode_notification ['true', 'false', 1, 0] :is_raw Is raw?
        # @option episode_notification ['true', 'false', 1, 0] :is_subtitles Is with subtitles?
        # @option episode_notification ['true', 'false', 1, 0] :is_anime365 Is Anime365?
        # @param token [String] Private token required to access this api
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created episode notification
        #
        # @see https://shikimori.one/api/doc/2.0/episode_notifications/create Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #              app_name: 'Api Test',
        #              aceess_token: '****',
        #              refresh_token: '****'
        #            )
        #
        #   notification = {
        #     aired_at: "2022-11-19T17:19:31+03:00",
        #     anime_id: "35",
        #     episode: "3",
        #     is_anime365: "true",
        #     is_fandub: "true",
        #     is_raw: "false",
        #     is_subtitles: "false"
        #    }
        #   token = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        #
        #   client.v2.create_episode_notification(notification, token: token)
        def create_episode_notification(episode_notification, token:, headers: nil, **query)
          rest.post base_url.join('episode_notifications').url,
                    { episode_notification: episode_notification, token: token },
                    headers: headers, query: query
        end
      end
    end
  end
end
