# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Clubs API
      #
      # @see https://shikimori.one/api/doc/1.0/clubs Shikimori's API documentation
      module Clubs
        # Get list of clubs
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of clubs per page. Must be a lower or equal that 30
        # @option query [String] :search Filter by name of club
        #
        # @return [Array<Hash>] Array of hashes representing clubs
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/index Shikimori's API documentation
        # @example Search a 20 clubs with name equal to 'yuri'
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.clubs(search: 'yuri')
        def clubs(headers: nil, **query)
          rest.get base_url.join('clubs').url, headers: headers, query: query
        end

        # Get a club by id
        #
        # @param id [#to_s] Club id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing club
        #
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/show Shikimori's API documentation
        # @example Get a club with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club(1)
        def club(id, headers: nil, **query)
          rest.get base_url.join('clubs', id.to_s).url, headers: headers, query: query
        end

        # Update Club.
        # Requires `clubs` oauth scope
        #
        # @param id [#to_s] Club id
        # @param club [Hash] Club data for updating
        # @option club [String] :name Club's name
        # @option club [String] :description Club's description
        # @option club ['true', 'false', 1, 0] :display_images Display club's images?
        # @option club ["free", "members", "admins"] :comment_policy Club's comments policy
        # @option club ["members", "admins"] :topic_policy Club's topics policy
        # @option club ["members", "admins"] :image_upload_policy Club's uploading images policy
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing updated club
        #
        # @raise [Shikimori::API::ForbiddenError] if user authorized without `clubs` scope
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/update Shikimori's API documentation
        # @example Update club's name and topic policy
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.update_club(1, { name: "Best of the best", topic_policy: "admins" }) #=> { id: 1, ... }
        def update_club(id, club, headers: nil, **query)
          rest.put base_url.join('clubs', id.to_s).url, { club: club }, headers: headers, query: query
        end

        # Get list of club's animes
        #
        # @param id [#to_s] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of clubs per page. Must be a lower or equal that 20
        #
        # @return [Array<Hash>] Array of hashes representing club animes
        #
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/animes Shikimori's API documentation
        # @example First 20 club animes
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club_animes(limit: 20) #=> [{ id: 1, ...}, ...]
        def club_animes(id, headers: nil, **query)
          rest.get base_url.join('clubs', id.to_s, 'animes').url, headers: headers, query: query
        end

        # Get list of club's mangas
        #
        # @param id [#to_s] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of clubs per page. Must be a lower or equal that 20
        #
        # @return [Array<Hash>] Array of hashes representing club mangas
        #
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/mangas Shikimori's API documentation
        # @example First 20 club mangas
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club_mangas(limit: 20) #=> [{ id: 1, ...}, ...]
        def club_mangas(id, headers: nil, **query)
          rest.get base_url.join('clubs', id.to_s, 'mangas').url, headers: headers, query: query
        end

        # Get list of club's ranobe
        #
        # @param id [#to_s] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of clubs per page. Must be a lower or equal that 20
        #
        # @return [Array<Hash>] Array of hashes representing club ranobe
        #
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/ranobe Shikimori's API documentation
        # @example First 20 club ranobe
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club_ranobe(limit: 20) #=> [{ id: 1, ...}, ...]
        def club_ranobe(id, headers: nil, **query)
          rest.get base_url.join('clubs', id.to_s, 'ranobe').url, headers: headers, query: query
        end

        # Get list of club's characters
        #
        # @param id [#to_s] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of clubs per page. Must be a lower or equal that 20
        #
        # @return [Array<Hash>] Array of hashes representing club characters
        #
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/characters Shikimori's API documentation
        # @example First 20 club characters
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club_characters(limit: 20) #=> [{ id: 1, ...}, ...]
        def club_characters(id, headers: nil, **query)
          rest.get base_url.join('clubs', id.to_s, 'characters').url, headers: headers, query: query
        end

        # Get list of club's collections
        #
        # @param id [#to_s] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of clubs per page. Must be a lower or equal that 20
        #
        # @return [Array<Hash>] Array of hashes representing club collections
        #
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/collections Shikimori's API documentation
        # @example First 20 club collections
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club_collections(limit: 20) #=> [{ id: 1, ...}, ...]
        def club_collections(id, headers: nil, **query)
          rest.get base_url.join('clubs', id.to_s, 'collections').url, headers: headers, query: query
        end

        # Get list of club's clubs
        #
        # @param id [#to_s] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of clubs per page. Must be a lower or equal that 20
        #
        # @return [Array<Hash>] Array of hashes representing club clubs
        #
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/clubs Shikimori's API documentation
        # @example First 20 club clubs
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club_clubs(limit: 20) #=> [{ id: 1, ...}, ...]
        def club_clubs(id, headers: nil, **query)
          rest.get base_url.join('clubs', id.to_s, 'clubs').url, headers: headers, query: query
        end

        # Get list of club's members
        #
        # @param id [#to_s] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of clubs per page. Must be a lower or equal that 20
        #
        # @return [Array<Hash>] Array of hashes representing club members
        #
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/members Shikimori's API documentation
        # @example First 20 club members
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club_members(limit: 20) #=> [{ id: 1, ...}, ...]
        def club_members(id, headers: nil, **query)
          rest.get base_url.join('clubs', id.to_s, 'members').url, headers: headers, query: query
        end

        # Get list of club's images
        #
        # @param id [#to_s] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of clubs per page. Must be a lower or equal that 100
        #
        # @return [Array<Hash>] Array of hashes representing club images
        #
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/images Shikimori's API documentation
        # @example First 20 club images
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.club_images(limit: 20) #=> [{ id: 1, ...}, ...]
        def club_images(id, headers: nil, **query)
          rest.get base_url.join('clubs', id.to_s, 'images').url, headers: headers, query: query
        end

        # Join to club.
        # Requires `clubs` oauth scope
        # @param id [String] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if join successful, error otherwise.
        #
        # @raise [Shikimori::API::ForbiddenError] if user authorized without `clubs` scope
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/join Shikimori's API documentation
        # @example Join to club with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.join_club(1)
        def join_club(id, headers: nil, **query)
          rest.post base_url.join('clubs', id.to_s, 'join').url, {}, headers: headers, query: query

          true
        end

        # Leave from club.
        # Requires `clubs` oauth scope
        # @param id [String] Club's id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if leave successful, error otherwise.
        #
        # @raise [Shikimori::API::ForbiddenError] if user authorized without `clubs` scope
        # @raise [Shikimori::API::NotFoundError] if club not exists
        #
        # @see https://shikimori.one/api/doc/1.0/clubs/leave Shikimori's API documentation
        # @example Leave from club with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.leave_club(1)
        def leave_club(id, headers: nil, **query)
          rest.post base_url.join('clubs', id.to_s, 'leave').url, {}, headers: headers, query: query

          true
        end
      end
    end
  end
end
