# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the People API
      #
      # @see https://shikimori.one/api/doc/1.0/people Shikimori's API documentation
      module People
        # Get list of People
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [String] :search Filter by person name
        # @option query ['seyu', 'mangaka', 'producer'] :kind Filter by person type
        #
        # @return [Array<Hash>] Array of hashes representing people
        #
        # @see https://shikimori.one/api/doc/1.0/people/search Shikimori's API documentation
        # @example Search a Hayao Miyazaki at mangakas list
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.people(search: 'Hayao Miyazaki', kind: 'mangaka')
        def people(headers: nil, **query)
          rest.get base_url.join('people', 'search').url, headers: headers, query: query
        end

        # Get an person by id
        #
        # @param id [String, Integer] Person id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing person
        #
        # @see https://shikimori.one/api/doc/1.0/people/show Shikimori's API documentation
        # @example Get a person with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.person(1)
        def person(id, headers: nil, **query)
          rest.get base_url.join('people', id.to_s).url, headers: headers, query: query
        end
      end
    end
  end
end
