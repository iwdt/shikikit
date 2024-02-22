# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Favorites API
      #
      # @see https://shikimori.one/api/doc/1.0/favorites Shikimori's API documentation
      module Favorites
        # Add object to favorites
        #
        # @param id [#to_s] Favorite's object id
        # @param type ['person', 'anime', 'manga', 'ranobe', 'character'] Favorite's object type
        # @param person_type ['common', 'seyu', 'mangaka', 'producer', 'person'] Person type.
        #   Required for :type equal to person
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Bool] True if create a new favorite is successful
        #
        # @see https://shikimori.one/api/doc/1.0/favorites/create Shikimori's API documentation
        # @example Add mangaka with id equal to 1 to favorites
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_favorite(1, type: 'person', person_type: 'mangaka')
        # @example Add anime with id equal to 1 to favorites
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_favorite(1, type: 'anime') #=> { success: true, notice: '...' }
        def create_favorite(id, type:, person_type: 'person', headers: nil, **query)
          path = creation_favorite_path_by(type.to_s.downcase, id.to_s, person_type)
          rest.post base_url.join('favorites', *path).url, {}, headers: headers, query: query

          true
        end

        # Delete Favorite
        #
        # @param id [String, Integer] Favorite id
        # @param type ['person', 'anime', 'manga', 'ranobe', 'character'] Favorite's object type
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/favorites/destroy Shikimori's API documentation
        # @example Delete person with id equal to 1 from favorites
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_favorite(1, type: 'person')
        # @example Delete anime with id equal to 1 from favorites
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_favorite(1, type: 'anime') #=> true
        def delete_favorite(id, type:, headers: nil, **query)
          path = deletion_favorite_path_by(type.to_s.downcase, id.to_s)
          rest.delete base_url.join('favorites', *path).url, headers: headers, query: query

          true
        end

        # Reorder favorite
        #
        # @param id [#to_s] Favorite's id
        # @param position [Integer] New position for favroite. Must be greater or equal than 0
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Bool] True if reordering is successful
        #
        # @see https://shikimori.one/api/doc/1.0/favorites/reorder Shikimori's API documentation
        # @example Reorder favorite with id equal to 1 to 10 position
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.reorder_favorite(1, position: 10)
        def reorder_favorite(id, position:, headers: nil, **query)
          rest.post(
            base_url.join('favorites', id.to_s, 'reorder').url,
            { new_index: position },
            headers: headers, query: query
          )

          true
        end

        private

        # Generate path for adding to favorites
        #
        # @param type [String] Type of favorite
        # @param id [String] Favorite's object id
        # @param person_type [String] Person type
        #
        # @return [Array<String>] Array of path to adding object to favorites
        def creation_favorite_path_by(type, id, person_type = 'person')
          case type
          when 'person'
            ['Person', id, person_type]
          when 'manga'
            ['Manga', id]
          when 'ranobe'
            ['Ranobe', id]
          when 'character'
            ['Character', id]
          else
            ['Anime', id]
          end
        end

        # Generate path for deletion from favorites
        #
        # @param type [String] Type of favorite
        # @param id [String] Favorite's object id
        #
        # @return [Array<String>] Array of path to delete object from favorites
        def deletion_favorite_path_by(type, id)
          case type
          when 'person'
            ['Person', id]
          when 'manga'
            ['Manga', id]
          when 'ranobe'
            ['Ranobe', id]
          when 'character'
            ['Character', id]
          else
            ['Anime', id]
          end
        end
      end
    end
  end
end
