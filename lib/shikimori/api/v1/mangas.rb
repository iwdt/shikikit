# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Mangas API
      #
      # @see https://shikimori.one/api/doc/1.0/mangas Shikimori's API documentation
      module Mangas
        # Get list of manga titles
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Filters and pagination for mangas
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 50
        # @option query ["id", "id_desc", "ranked", "chapters",
        #  "kind", "popularity", "name",
        #  "aired_on", "volumes", "status",
        #  "random", "ranked_random",
        #  "ranked_shiki", "created_at", "created_at_desc"] :order Sorting type.
        # @option query [String, Symbol] :type Type of title. Deprecated! use :kind instead
        # @option query ["manga", "manhwa", "manhua",
        #   "light_novel", "novel",
        #   "one_shot", "doujin"] :kind Type of manga title
        # @option query ["anons", "ongoing", "released", "paused", "discontinued"] :status Manga title status
        # @option query [String] :season Manga season. Examples: "summer_2017", "2016", "2014_2016", "199x"
        # @option query [Integer] :score Minimal manga score
        # @option query [String] :genre List of genre ids separated by comma
        # @option query [String] :genre_v2 List of genre v2 ids separated by comma
        # @option query [String] :publisher List of publisher ids separated by comma
        # @option query [String] :franchise List of franchises separated by comma
        # @option query [TrueClass, FalseClass] :censored Set to false to allow hentai, yaoi and yuri
        # @option query ["planned", "watching", "rewatching",
        #   "completed", "on_hold", "dropped"] :mylist Status of anime in current user list
        # @option query [String] :ids List of anime ids separated by comma
        # @option query [String] :exclude_ids List of anime ids separated by comma
        # @option query [String] :search Search phrase to filter mangas by name
        #
        # @return [Array<Hash>] Array of hashes representing mangas
        #
        # @see https://shikimori.one/api/doc/1.0/mangas/index Shikimori's API documentation
        # @example Get 20 manga titles on second page
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.mangas(page: 2, limit: 20) #=> [{ id: 1, ... }, { id: 2, ... }, ...]
        # @example Get top 50 ongoing manga titles
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.mangas(limit: 50, status: 'ongoing', order: 'ranked') #=> [{ id: 1, ... }, { id: 2, ... }, ...]
        # @example Get 10 random manga titles released in the 90s
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.mangas(limit: 10, order: 'random', season: '199x') #=> [{ id: 1, ... }, { id: 2, ... }, ...]
        def mangas(headers: nil, **query)
          rest.get base_url.join('mangas').url, headers: headers, query: query
        end

        # Get an manga by id
        #
        # @param id [#to_s] Manga id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing Manga
        #
        # @see https://shikimori.one/api/doc/1.0/mangas/show Shikimori's API documentation
        # @example Get manga with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.manga(1) #=> { id: 1, ... }
        def manga(id, headers: nil, **query)
          rest.get base_url.join('mangas', id.to_s).url, headers: headers, query: query
        end

        # Get an manga roles
        #
        # @param id [#to_s] manga id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing manga roles
        #
        # @see https://shikimori.one/api/doc/1.0/mangas/roles Shikimori's API documentation
        # @example Get a first manga roles
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.manga_roles(1) #=> { roles: [...], roles_russian: [...], character: {...}, person: {...} }
        def manga_roles(id, headers: nil, **query)
          rest.get base_url.join('mangas', id.to_s, 'roles').url, headers: headers, query: query
        end

        # Get an manga similar
        #
        # @param id [#to_s] Manga id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing similar mangas
        #
        # @see https://shikimori.one/api/doc/1.0/mangas/similar Shikimori's API documentation
        # @example Get a similar manga titles for manga with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.manga_similar(1) #=> { id: 2, ... }
        def manga_similar(id, headers: nil, **query)
          rest.get base_url.join('mangas', id.to_s, 'similar').url, headers: headers, query: query
        end

        # Get an related mangas
        #
        # @param id [#to_s] Manga id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing related mangas
        #
        # @see https://shikimori.one/api/doc/1.0/mangas/related Shikimori's API documentation
        # @example Get a related anime, manga and ranobe titles for anime with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.manga_related(1)
        #   #=> [{ relation: "...", relation_russian: "...", anime: { id: 3, ... }, manga: { id: 1, ... } }]
        def manga_related(id, headers: nil, **query)
          rest.get base_url.join('mangas', id.to_s, 'related').url, headers: headers, query: query
        end

        # Get an manga franchise
        #
        # @param id [#to_s] Manga id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing of manga's franchise tree
        #
        # @see https://shikimori.one/api/doc/1.0/mangas/franchise Shikimori's API documentation
        # @example Get manga franchise tree for manga with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.manga_franchise(1) #=> { links: [{ id: 1, ... }], nodes: [{ id: 1, ... }], current_id: 1 }
        def manga_franchise(id, headers: nil, **query)
          rest.get base_url.join('mangas', id.to_s, 'franchise').url, headers: headers, query: query
        end

        # Get an manga external links
        #
        # @param id [#to_s] Manga id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing manga's extenal links
        #
        # @see https://shikimori.one/api/doc/1.0/mangas/external_links Shikimori's API documentation
        # @example Get related external links for manga with id equal 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.manga_external_links(1) #=> [{ id: 1, ... }, { id: nil, ... }]
        def manga_external_links(id, headers: nil, **query)
          rest.get base_url.join('mangas', id.to_s, 'external_links').url, headers: headers, query: query
        end

        # Get an manga topics
        #
        # @param id [#to_s] Manga id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 50
        # @return [Array<Hash>] Array of hashes representing manga's topics
        #
        # @see https://shikimori.one/api/doc/1.0/mangas/topics Shikimori's API documentation
        # @example Get topics for manga with id equal 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.manga_topics(1) #=> [{ id: 1, ... }]
        def manga_topics(id, headers: nil, **query)
          rest.get base_url.join('mangas', id.to_s, 'topics').url, headers: headers, query: query
        end
      end
    end
  end
end
