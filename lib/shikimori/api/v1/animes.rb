# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Animes API
      #
      # @see https://shikimori.one/api/doc/1.0/animes Shikimori's API documentation
      module Animes
        # Get list of anime titles
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Filters and pagination for animes
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 50
        # @option query ["id", "id_desc", "ranked",
        #  "kind", "popularity", "name",
        #  "aired_on", "episodes", "status",
        #  "random", "ranked_random",
        #  "ranked_shiki", "created_at", "created_at_desc"] :order Sorting type.
        # @option query [String, Symbol] :type Type of title. Deprecated! use :kind instead
        # @option query ["tv", "movie", "ova",
        #   "ona", "special", "tv_special",
        #   "music", "pv", "cm", "tv_13",
        #   "tv_24", "tv_48"] :kind Type of anime title
        # @option query ["anons", "ongoing", "released"] :status Anime title status
        # @option query [String] :season Anime season. Examples: "summer_2017", "2016", "2014_2016", "199x"
        # @option query [Integer] :score Minimal anime score
        # @option query ["S", "D", "F"] :duration Duration of anime title episode,
        #   where S – less than 10 minutes, D – less than 30 minutes and F – more than 30 minutes
        # @option query ["none", "g", "pg", "pg_13", "r", "r_plus", "rx"] :rating Age limit level of anime title
        # @option query [String] :genre List of genre ids separated by comma
        # @option query [String] :genre_v2 List of genre v2 ids separated by comma
        # @option query [String] :studio List of studio ids separated by comma
        # @option query [String] :franchise List of franchises separated by comma
        # @option query [TrueClass, FalseClass] :censored Set to false to allow hentai, yaoi and yuri
        # @option query ["planned", "watching", "rewatching",
        #   "completed", "on_hold", "dropped"] :mylist Status of anime in current user list
        # @option query [String] :ids List of anime ids separated by comma
        # @option query [String] :exclude_ids List of anime ids separated by comma
        # @option query [String] :search Search phrase to filter animes by name
        #
        # @return [Array<Hash>] Array of hashes representing animes
        #
        # @see https://shikimori.one/api/doc/1.0/animes/index Shikimori's API documentation
        # @example Get 20 anime titles on second page
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.animes(page: 2, limit: 20) #=> [{ id: 1, ... }, { id: 2, ... }, ...]
        # @example Get top 50 ongoing anime titles
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.animes(limit: 50, status: 'ongoing', order: 'ranked') #=> [{ id: 1, ... }, { id: 2, ... }, ...]
        # @example Get 10 random anime titles released in the 90s
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.animes(limit: 10, order: 'random', season: '199x') #=> [{ id: 1, ... }, { id: 2, ... }, ...]
        def animes(headers: nil, **query)
          rest.get base_url.join('animes').url, headers: headers, query: query
        end

        # Get an anime by id
        #
        # @param id [#to_s] Anime id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing anime
        #
        # @see https://shikimori.one/api/doc/1.0/animes/show Shikimori's API documentation
        # @example Get anime with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime(1) #=> { id: 1, ... }
        def anime(id, headers: nil, **query)
          rest.get base_url.join('animes', id.to_s).url, headers: headers, query: query
        end

        # Get an anime roles
        #
        # @param id [#to_s] Anime id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing anime roles
        #
        # @raise [Shikimori::API::NotFoundError] if anime not exists
        #
        # @see https://shikimori.one/api/doc/1.0/animes/roles Shikimori's API documentation
        # @example Get a first anime roles
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime_roles(1) #=> { roles: [...], roles_russian: [...], character: {...}, person: {...} }
        def anime_roles(id, headers: nil, **query)
          rest.get base_url.join('animes', id.to_s, 'roles').url, headers: headers, query: query
        end

        # Get an anime similar
        #
        # @param id [#to_s] Anime id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing similar animes
        #
        # @raise [Shikimori::API::NotFoundError] if anime not exists
        #
        # @see https://shikimori.one/api/doc/1.0/animes/similar Shikimori's API documentation
        # @example Get a similar anime titles for anime with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime_similar(1) #=> { id: 2, ... }
        def anime_similar(id, headers: nil, **query)
          rest.get base_url.join('animes', id.to_s, 'similar').url, headers: headers, query: query
        end

        # Get an related animes
        #
        # @param id [#to_s] Anime id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing related animes
        #
        # @raise [Shikimori::API::NotFoundError] if anime not exists
        #
        # @see https://shikimori.one/api/doc/1.0/animes/related Shikimori's API documentation
        # @example Get a related anime, manga and ranobe titles for anime with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime_related(1)
        #   #=> [{ relation: "...", relation_russian: "...", anime: { id: 3, ... }, manga: { id: 1, ... } }]
        def anime_related(id, headers: nil, **query)
          rest.get base_url.join('animes', id.to_s, 'related').url, headers: headers, query: query
        end

        # Get an anime screenshots
        #
        # @param id [#to_s] Anime id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing anime screenshots
        #
        # @raise [Shikimori::API::NotFoundError] if anime not exists
        #
        # @see https://shikimori.one/api/doc/1.0/animes/screenshots Shikimori's API documentation
        # @example Get screenshots for anime with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime_screenshots(1) #=> [{ original: "...", preview: "..." }]
        def anime_screenshots(id, headers: nil, **query)
          rest.get base_url.join('animes', id.to_s, 'screenshots').url, headers: headers, query: query
        end

        # Get an anime franchise
        #
        # @param id [#to_s] Anime id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing of anime's franchise tree
        #
        # @raise [Shikimori::API::NotFoundError] if anime not exists
        #
        # @see https://shikimori.one/api/doc/1.0/animes/franchise Shikimori's API documentation
        # @example Get anime franchise tree for anime with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime_franchise(1) #=> { links: [{ id: 1, ... }], nodes: [{ id: 1, ... }], current_id: 1 }
        def anime_franchise(id, headers: nil, **query)
          rest.get base_url.join('animes', id.to_s, 'franchise').url, headers: headers, query: query
        end

        # Get an anime external links
        #
        # @param id [#to_s] Anime id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing anime's extenal links
        #
        # @raise [Shikimori::API::NotFoundError] if anime not exists
        #
        # @see https://shikimori.one/api/doc/1.0/animes/external_links Shikimori's API documentation
        # @example Get related external links for anime with id equal 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime_external_links(1) #=> [{ id: 1, ... }, { id: nil, ... }]
        def anime_external_links(id, headers: nil, **query)
          rest.get base_url.join('animes', id.to_s, 'external_links').url, headers: headers, query: query
        end

        # Get an anime topics
        #
        # @param id [#to_s] Anime id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 50
        # @option query ['anons', 'ongoing', 'released', 'episode'] :kind Type of topic
        # @option query [Integer] :episode Number of anime's episode. Required for :kind equal to 'episode'
        #
        # @return [Array<Hash>] Array of hashes representing anime's topics
        #
        # @raise [Shikimori::API::NotFoundError] if anime not exists
        #
        # @see https://shikimori.one/api/doc/1.0/animes/topics Shikimori's API documentation
        # @example Get topics for anime with id equal 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.anime_topics(1) #=> [{ id: 1, ... }]
        def anime_topics(id, headers: nil, **query)
          rest.get base_url.join('animes', id.to_s, 'topics').url, headers: headers, query: query
        end
      end
    end
  end
end
