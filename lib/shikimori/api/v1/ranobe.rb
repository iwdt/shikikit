# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Ranobes API
      #
      # @see https://shikimori.one/api/doc/1.0/ranobe Shikimori's API documentation
      module Ranobe
        # Get list of ranobe titles
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Filters and pagination for ranobes
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 50
        # @option query ["id", "id_desc", "ranked", "chapters",
        #  "kind", "popularity", "name",
        #  "aired_on", "volumes", "status",
        #  "random", "ranked_random",
        #  "ranked_shiki", "created_at", "created_at_desc"] :order Sorting type.
        # @option query ["anons", "ongoing", "released", "paused", "discontinued"] :status Ranobe title status
        # @option query [String] :season Ranobe season. Examples: "summer_2017", "2016", "2014_2016", "199x"
        # @option query [Integer] :score Minimal ranobe score
        # @option query [String] :genre List of genre ids separated by comma
        # @option query [String] :publisher List of publisher ids separated by comma
        # @option query [String] :franchise List of franchises separated by comma
        # @option query [TrueClass, FalseClass] :censored Set to false to allow hentai, yaoi and yuri
        # @option query ["planned", "watching", "rewatching",
        #   "completed", "on_hold", "dropped"] :mylist Status of anime in current user list
        # @option query [String] :ids List of anime ids separated by comma
        # @option query [String] :exclude_ids List of anime ids separated by comma
        # @option query [String] :search Search phrase to filter ranobes by name
        #
        # @return [Array<Hash>] Array of hashes representing ranobes
        #
        # @see https://shikimori.one/api/doc/1.0/ranobe/index Shikimori's API documentation
        # @example Get 20 ranobe titles on second page
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobes(page: 2, limit: 20) #=> [{ id: 1, ... }, { id: 2, ... }, ...]
        # @example Get top 50 ongoing ranobe titles
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobes(limit: 50, status: 'ongoing', order: 'ranked') #=> [{ id: 1, ... }, { id: 2, ... }, ...]
        # @example Get 10 random ranobe titles released in the 90s
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobes(limit: 10, order: 'random', season: '199x') #=> [{ id: 1, ... }, { id: 2, ... }, ...]
        def ranobes(headers: nil, **query)
          rest.get base_url.join('ranobe').url, headers: headers, query: query
        end

        # Get an ranobe by id
        #
        # @param id [#to_s] ranobe id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing ranobe
        #
        # @see https://shikimori.one/api/doc/1.0/ranobe/show Shikimori's API documentation
        # @example Get ranobe with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobe(1) #=> { id: 1, ... }
        def ranobe(id, headers: nil, **query)
          rest.get base_url.join('ranobe', id.to_s).url, headers: headers, query: query
        end

        # Get an ranobe roles
        #
        # @param id [#to_s] ranobe id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing ranobe roles
        #
        # @see https://shikimori.one/api/doc/1.0/ranobe/roles Shikimori's API documentation
        # @example Get a first ranobe roles
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobe_roles(1) #=> { roles: [...], roles_russian: [...], character: {...}, person: {...} }
        def ranobe_roles(id, headers: nil, **query)
          rest.get base_url.join('ranobe', id.to_s, 'roles').url, headers: headers, query: query
        end

        # Get an ranobe similar
        #
        # @param id [#to_s] ranobe id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing similar ranobes
        #
        # @see https://shikimori.one/api/doc/1.0/ranobe/similar Shikimori's API documentation
        # @example Get a similar ranobe titles for ranobe with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobe_similar(1) #=> { id: 2, ... }
        def ranobe_similar(id, headers: nil, **query)
          rest.get base_url.join('ranobe', id.to_s, 'similar').url, headers: headers, query: query
        end

        # Get an related ranobes
        #
        # @param id [#to_s] ranobe id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing related ranobes
        #
        # @see https://shikimori.one/api/doc/1.0/ranobe/related Shikimori's API documentation
        # @example Get a related anime, manga and ranobe titles for anime with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobe_related(1)
        #   #=> [{ relation: "...", relation_russian: "...", anime: { id: 3, ... }, ranobe: { id: 1, ... } }]
        def ranobe_related(id, headers: nil, **query)
          rest.get base_url.join('ranobe', id.to_s, 'related').url, headers: headers, query: query
        end

        # Get an ranobe franchise
        #
        # @param id [#to_s] ranobe id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing of ranobe's franchise tree
        #
        # @see https://shikimori.one/api/doc/1.0/ranobe/franchise Shikimori's API documentation
        # @example Get ranobe franchise tree for ranobe with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobe_franchise(1) #=> { links: [{ id: 1, ... }], nodes: [{ id: 1, ... }], current_id: 1 }
        def ranobe_franchise(id, headers: nil, **query)
          rest.get base_url.join('ranobe', id.to_s, 'franchise').url, headers: headers, query: query
        end

        # Get an ranobe external links
        #
        # @param id [#to_s] ranobe id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing ranobe's extenal links
        #
        # @see https://shikimori.one/api/doc/1.0/ranobe/external_links Shikimori's API documentation
        # @example Get related external links for ranobe with id equal 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobe_external_links(1) #=> [{ id: 1, ... }, { id: nil, ... }]
        def ranobe_external_links(id, headers: nil, **query)
          rest.get base_url.join('ranobe', id.to_s, 'external_links').url, headers: headers, query: query
        end

        # Get an ranobe topics
        #
        # @param id [#to_s] ranobe id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 50
        # @return [Array<Hash>] Array of hashes representing ranobe's topics
        #
        # @see https://shikimori.one/api/doc/1.0/ranobe/topics Shikimori's API documentation
        # @example Get topics for ranobe with id equal 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.ranobe_topics(1) #=> [{ id: 1, ... }]
        def ranobe_topics(id, headers: nil, **query)
          rest.get base_url.join('ranobe', id.to_s, 'topics').url, headers: headers, query: query
        end
      end
    end
  end
end
