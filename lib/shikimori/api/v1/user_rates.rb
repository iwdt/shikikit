# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the User rates API
      #
      # @see https://shikimori.one/api/doc/1.0/user_rates Shikimori's API documentation
      module UserRates
        # Get an user rate by id
        #
        # @param id [#to_s] user rate id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing user rate
        #
        # @see https://shikimori.one/api/doc/1.0/user_rates/show Shikimori's API documentation
        # @example Get user rate with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.user_rate(1) #=> { id: 1, ... }
        #
        # @deprecated Use {Shikimori::API::V2::UserRates#user_rate} instead
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
        # @see https://shikimori.one/api/doc/1.0/user_rates/create Shikimori's API documentation
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
        #   client.v1.create_user_rate(user_rate)
        #
        # @deprecated Use {Shikimori::API::V2::UserRates#create_user_rate} instead
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
        # @see https://shikimori.one/api/doc/1.0/user_rates/update Shikimori's API documentation
        # @example Update a user rate text
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   user_rate = {
        #     text: "text"
        #   }
        #   client.v1.update_user_rate(1, user_rate)
        #
        # @deprecated Use {Shikimori::API::V2::UserRates#update_user_rate} instead
        def update_user_rate(id, user_rate, headers: nil, **query)
          rest.put base_url.join('user_rates', id.to_s).url, { user_rate: user_rate }, headers: headers, query: query
        end

        # Delete user rate
        #
        # @param id [#to_s] User rate id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/user_rates/destroy Shikimori's API documentation
        # @example Delete user rate
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_user_rate(1)
        #
        # @deprecated Use {Shikimori::API::V2::UserRates#delete_user_rate} instead
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
        # @see https://shikimori.one/api/doc/1.0/user_rates/increment Shikimori's API documentation
        # @example Increment episodes/chapters by 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.increment_user_rate(1)
        #
        # @deprecated Use {Shikimori::API::V2::UserRates#increment_user_rate} instead
        def increment_user_rate(id, headers: nil, **query)
          rest.post base_url.join('user_rates', id.to_s, 'increment').url, {}, headers: headers, query: query
        end

        # Delete entire user rates and history
        #
        # @param type ['anime', 'manga'] Type of cleanup
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/user_rates/cleanup Shikimori's API documentation
        # @example Delete entire user rates and history
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.cleanup_user_rates('manga')
        def cleanup_user_rates(type, headers: nil, **query)
          rest.delete base_url.join('user_rates', type.to_s, 'cleanup').url, headers: headers, query: query
        end

        # Reset all user scores to 0
        #
        # @param type ['anime', 'manga'] Type of reset
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/user_rates/reset Shikimori's API documentation
        # @example Reset all user scores to 0
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.reset_user_rates('manga')
        def reset_user_rates(type, headers: nil, **query)
          rest.delete base_url.join('user_rates', type.to_s, 'reset').url, headers: headers, query: query
        end
      end
    end
  end
end
