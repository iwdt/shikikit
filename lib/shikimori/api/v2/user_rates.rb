# frozen_string_literal: true

module Shikimori
  module API
    class V2
      # Methods for the User rates API
      #
      # @see https://shikimori.one/api/doc/2.0/user_rates
      module UserRates
        # Get list of user rates
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 50
        # @option query [Integer] :user_id User ID
        # @option query [Integer] :target_id Target ID
        # @option query ['Anime', 'Manga'] :target_type Target ID
        # @option query ['planned', 'watching', 'rewatching',
        #   'completed', 'on_hold', 'dropped'] :status Watching/Reading status
        #
        # @return [Array<Hash>] Array of hashes representing user rates
        #
        # @see https://shikimori.one/api/doc/2.0/user_rates/index Shikimori's API documentation
        # @example List of user rates
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v2.user_rates(status: 'planned')
        def user_rates(headers: nil, **query)
          rest.get base_url.join('user_rates').url, headers: headers, query: query
        end

        # Get an user rate by id
        #
        # @param id [#to_s] user rate id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing user rate
        #
        # @see https://shikimori.one/api/doc/2.0/user_rates/show Shikimori's API documentation
        # @example Get user rate with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v2.user_rate(1) #=> { id: 1, ... }
        def user_rate(id, headers: nil, **query)
          rest.get base_url.join('user_rates', id.to_s).url, headers: headers, query: query
        end

        # Create a user rate.
        # Requires `user_rates` oauth scope
        #
        # @param user_rate [Hash] User rate data for creating
        # @option user_rate [Integer] :user_id User id
        # @option user_rate [Integer] :target_id Target id
        # @option user_rate ['Anime', 'Manga'] :target_type Target type
        # @option user_rate ["planned", "watching", "rewatching",
        #   "completed", "on_hold", "dropped"] :status Watching status
        # @option user_rate [Numeric] :score Score
        # @option user_rate [Numeric] :chapters Current chapter number
        # @option user_rate [Numeric] :episodes Current episode number
        # @option user_rate [Numeric] :volumes Current volume number
        # @option user_rate [Numeric] :rewatches Count of rewatching
        # @option user_rate [String] :text Rate text
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created user rate
        #
        # @see https://shikimori.one/api/doc/2.0/user_rates/create Shikimori's API documentation
        # @example Create a user rate
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   user_rate = {
        #     text: "text",
        #     user_id: 1,
        #     target_id: "41",
        #     target_type: "Anime"
        #   }
        #   client.v2.create_user_rate(user_rate)
        def create_user_rate(user_rate, headers: nil, **query)
          rest.post base_url.join('user_rates').url, { user_rate: user_rate }, headers: headers, query: query
        end

        # Update a user rate.
        # Requires `user_rates` oauth scope
        #
        # @param id [#to_s] User rate id
        # @param user_rate [Hash] User rate data for creating
        # @option user_rate ["planned", "watching", "rewatching",
        #   "completed", "on_hold", "dropped"] :status Watching status
        # @option user_rate [Numeric] :score Score
        # @option user_rate [Numeric] :chapters Current chapter number
        # @option user_rate [Numeric] :episodes Current episode number
        # @option user_rate [Numeric] :volumes Current volume number
        # @option user_rate [Numeric] :rewatches Count of rewatching
        # @option user_rate [String] :text Rate text
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing updated user rate
        #
        # @see https://shikimori.one/api/doc/2.0/user_rates/update Shikimori's API documentation
        # @example Update a user rate text
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   user_rate = {
        #     text: "text"
        #   }
        #   client.v2.update_user_rate(1, user_rate)
        def update_user_rate(id, user_rate, headers: nil, **query)
          rest.put base_url.join('user_rates', id.to_s).url, { user_rate: user_rate }, headers: headers, query: query
        end

        # Delete user rate.
        # Requires `user_rates` oauth scope
        #
        # @param id [#to_s] User rate id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/2.0/user_rates/destroy Shikimori's API documentation
        # @example Delete user rate
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v2.delete_user_rate(1)
        def delete_user_rate(id, headers: nil, **query)
          rest.delete base_url.join('user_rates', id.to_s).url, headers: headers, query: query
        end

        # Increment episodes/chapters by 1
        # Requires `user_rates` oauth scope
        #
        # @param id [#to_s] User rate ID
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created user rate
        #
        # @see https://shikimori.one/api/doc/2.0/user_rates/increment Shikimori's API documentation
        # @example Increment episodes/chapters by 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v2.increment_user_rate(1)
        def increment_user_rate(id, headers: nil, **query)
          rest.post base_url.join('user_rates', id.to_s, 'increment').url, {}, headers: headers, query: query
        end
      end
    end
  end
end
