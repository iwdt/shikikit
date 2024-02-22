# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Videos API
      #
      # @see https://shikimori.one/api/doc/1.0/videos Shikimori's API documentation
      module Videos
        # Get anime videos
        #
        # @param anime_id [#to_s] Anime id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing videos
        #
        # @see https://shikimori.one/api/doc/1.0/videos/index Shikimori's API documentation
        # @example Get videos for anime with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime_videos(1)
        def anime_videos(anime_id, headers: nil, **query)
          rest.get base_url.join('animes', anime_id.to_s, 'videos').url, headers: headers, query: query
        end

        # Create Video
        #
        # @param video [Hash] Video data for creating
        # @option video [String] :name Name of video
        # @option video ['pv', 'character_trailer', 'cm', 'op',
        #   'ed', 'op_ed_clip', 'clip', 'other', 'episode_preview'] :kind Type of video
        # @option video [String] :url URL to video.
        #   Supported hostings: youtube, vk, ok, coub, rutube, vimeo, sibnet,
        #   yandex, streamable, smotret_anime, myvi, youmite, viuly, stormo, mediafile
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created video
        #
        # @see https://shikimori.one/api/doc/1.0/videos/create Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   video = { name: 'Funny cat!', kind: 'ed', url: 'https://youtu.be/dQw4w9WgXcQ' }
        #   client.v1.create_anime_video(1, video)
        def create_anime_video(anime_id, video, headers: nil, **query)
          rest.post base_url.join('animes', anime_id.to_s, 'videos').url,
                    { video: video },
                    headers: headers, query: query
        end

        # Delete Video
        #
        # @param anime_id [#to_s] Anime id
        # @param video_id [#to_s] Video id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/videos/destroy Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #
        #   client.v1.delete_anime_video(anime_id: 1, video_id: 1)
        def delete_anime_video(anime_id:, video_id:, headers: nil, **query)
          rest.delete base_url.join('animes', anime_id.to_s, 'videos', video_id.to_s).url,
                      headers: headers,
                      query: query
        end
      end
    end
  end
end
