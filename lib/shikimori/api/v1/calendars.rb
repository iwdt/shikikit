# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Calendars API
      #
      # @see https://shikimori.one/api/doc/1.0/calendars Shikimori's API documentation
      module Calendars
        # Get a calendar
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [TrueClass, FalseClass] :censored Set to false to allow hentai, yaoi and yuri
        #
        # @return [Array<Hash>] Array of hashes representing calendars
        #
        # @see https://shikimori.one/api/doc/1.0/calendars/show Shikimori's API documentation
        # @example Get a calendar
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.calendar #=> [{ next_episode: 1, anime: [{ id: 1, ... }], ... }]
        def calendar(headers: nil, **query)
          rest.get base_url.join('calendar').url, headers: headers, query: query
        end
      end
    end
  end
end
