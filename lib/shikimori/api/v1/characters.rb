# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Characters API
      #
      # @see https://shikimori.one/api/doc/1.0/characters Shikimori's API documentation
      module Characters
        # Get list of Characters
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [String] :search A character name for searching
        #
        # @return [Array<Hash>] Array of hashes representing characters
        #
        # @see https://shikimori.one/api/doc/1.0/characters/search Shikimori's API documentation
        # @example Search characters
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.characters(search: 'asdf') #=> [{ id: 1, ... }]
        def characters(headers: nil, **query)
          rest.get base_url.join('characters', 'search').url, headers: headers, query: query
        end

        # Get a character by id
        #
        # @param id [#to_s] Character id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing character
        #
        # @see https://shikimori.one/api/doc/1.0/characters/show Shikimori's API documentation
        # @example Get character with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.character(1) #=> { id: 1, ... }
        def character(id, headers: nil, **query)
          rest.get base_url.join('characters', id.to_s).url, headers: headers, query: query
        end
      end
    end
  end
end
