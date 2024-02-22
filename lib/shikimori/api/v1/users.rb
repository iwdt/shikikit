# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Users API
      #
      # @see https://shikimori.one/api/doc/1.0/users Shikimori's API documentation
      module Users
        # Get list of users
        #
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 50
        # @option query [String] :search Find user by name
        #
        # @return [Array<Hash>] Array of hashes representing users
        #
        # @see https://shikimori.one/api/doc/1.0/users/index Shikimori's API documentation
        # @example Search users with by name "ivan"
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #
        #   client.v1.users(search: 'ivan')
        def users(headers: nil, **query)
          rest.get base_url.join('users').url, headers: headers, query: query
        end

        # Get an user
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing user
        #
        # @see https://shikimori.one/api/doc/1.0/users/show Shikimori's API documentation
        # @example Get a user with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #
        #   client.v1.user(1)
        def user(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s).url, headers: headers, query: query
        end

        # Get an user's brief info
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing user
        #
        # @see https://shikimori.one/api/doc/1.0/users/info Shikimori's API documentation
        # @example Get a user info with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_info(1)
        def user_info(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'info').url, headers: headers, query: query
        end

        # Get an current user's brief info
        #
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing user
        #
        # @see https://shikimori.one/api/doc/1.0/users/whoami Shikimori's API documentation
        # @example Get a current user info
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.whoami
        def whoami(headers: nil, **query)
          rest.get base_url.join('users', 'whoami').url, headers: headers, query: query
        end

        # Sign out the user
        #
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing user
        #
        # @see https://shikimori.one/api/doc/1.0/users/sign_out Shikimori's API documentation
        # @example Sign out current user
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.sign_out
        def sign_out(headers: nil, **query)
          rest.get base_url.join('users', 'sign_out').url, headers: headers, query: query
        end

        # Get an user's friends
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing user's friends
        #
        # @see https://shikimori.one/api/doc/1.0/users/friends Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_friends(1)
        def user_friends(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'friends').url, headers: headers, query: query
        end

        # Get an user's clubs
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing user's clubs
        #
        # @see https://shikimori.one/api/doc/1.0/users/clubs Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_clubs(1)
        def user_clubs(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'clubs').url, headers: headers, query: query
        end

        # Get an user's anime rates
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 5000
        # @option query [TrueClass, FalseClass] :censored Set to true to discard hentai, yaoi and yuri
        # @option query ['planned', 'watching', 'rewatching', 'completed', 'on_hold', 'dropped'] :status Watching status
        #
        # @return [Array<Hash>] Array of hashes representing user's anime rates
        #
        # @see https://shikimori.one/api/doc/1.0/users/anime_rates Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_anime_rates(1)
        def user_anime_rates(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'anime_rates').url, headers: headers, query: query
        end

        # Get an user's manga rates
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 5000
        # @option query [TrueClass, FalseClass] :censored Set to true to discard hentai, yaoi and yuri
        #
        # @return [Array<Hash>] Array of hashes representing user's manga rates
        #
        # @see https://shikimori.one/api/doc/1.0/users/manga_rates Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_manga_rates(1)
        def user_manga_rates(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'manga_rates').url, headers: headers, query: query
        end

        # Get an user's favorites
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing user's favorites
        #
        # @see https://shikimori.one/api/doc/1.0/users/favourites Shikimori's API documentation
        # @example
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_favorites(1)
        def user_favorites(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'favourites').url, headers: headers, query: query
        end

        # Get an user's messages
        # Requires `messages` oauth scope
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 100
        # @option query ['inbox', 'private', 'sent', 'news', 'notifications'] :type Type of messages
        #
        # @return [Array<Hash>] Array of hashes representing user's messages
        #
        # @see https://shikimori.one/api/doc/1.0/users/messages Shikimori's API documentation
        # @example Get user's messages from inbox
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_messages(1, type: 'inbox', limit: 10)
        def user_messages(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'messages').url, headers: headers, query: query
        end

        # Get an user's unread messages
        # Requires `messages` oauth scope
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing user's messages
        #
        # @see https://shikimori.one/api/doc/1.0/users/unread_messages Shikimori's API documentation
        # @example Get user's unread messages
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_unread_messages(1, type: 'inbox', limit: 10)
        def user_unread_messages(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'unread_messages').url, headers: headers, query: query
        end

        # Get an user's history
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 100
        # @option query [Integer] :target_id Target ID
        # @option query ['Anime', 'Manga'] :target_type Target type
        #
        # @return [Array<Hash>] Array of hashes representing user's history
        #
        # @see https://shikimori.one/api/doc/1.0/users/history Shikimori's API documentation
        # @example Get user's manga history
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_history(1, type: 'manga', limit: 10)
        def user_history(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'history').url, headers: headers, query: query
        end

        # Get an user's bans
        #
        # @option id [#to_s] User id
        # @option headers [Hash] Request headers
        # @option query [Hash] Query string parameters for request
        #
        # @return [Array<Hash>] Array of hashes representing user's bans
        #
        # @see https://shikimori.one/api/doc/1.0/users/bans Shikimori's API documentation
        # @example Get user's manga bans
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_bans
        def user_bans(id, headers: nil, **query)
          rest.get base_url.join('users', id.to_s, 'bans').url, headers: headers, query: query
        end
      end
    end
  end
end
