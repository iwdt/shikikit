# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Styles API
      #
      # @see https://shikimori.one/api/doc/1.0/styles Shikimori's API documentation
      module Styles
        # Get a style
        #
        # @param id [#to_s] Style id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing style
        #
        # @see https://shikimori.one/api/doc/1.0/styles/show Shikimori's API documentation
        # @example Get a style with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.style(1)
        def style(id, headers: nil, **query)
          rest.get base_url.join('styles', id.to_s).url, headers: headers, query: query
        end

        # Create style
        #
        # @param style [Hash] Style data for creating
        # @option style [String] :css Style CSS content
        # @option style [String] :name Style name
        # @option style [Integer] :owner_id Owner ID
        # @option style ['User', 'Club'] :owner_type Owner type
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created style
        #
        # @see https://shikimori.one/api/doc/1.0/styles/create Shikimori's API documentation
        # @example Create a red background style
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_style({
        #     name: 'Red background',
        #     css: 'body: { background: red !important; }',
        #     owner_id: 1,
        #     owner_type: 'User'
        #   })
        def create_style(style, headers: nil, **query)
          rest.post base_url.join('styles').url, { style: style }, headers: headers, query: query
        end

        # Update style
        #
        # @param id [Hash] Style's ID
        # @param style [Hash] Style data for updating
        # @option style [String] :css Style CSS content
        # @option style [String] :name Style name
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing updated style
        #
        # @see https://shikimori.one/api/doc/1.0/styles/update Shikimori's API documentation
        # @example Change style from red background to green
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #
        #   client.v1.update_style(
        #     1,
        #     { name: 'Green background', css: 'body: { background: green !important; }', }
        #   )
        def update_style(id, style, headers: nil, **query)
          rest.put base_url.join('styles', id.to_s).url, { style: style }, headers: headers, query: query
        end

        # Preview style
        #
        # @param style [Hash] Style data for preview
        # @option style [String] :css Style CSS content
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing updated style
        #
        # @see https://shikimori.one/api/doc/1.0/styles/preview Shikimori's API documentation
        # @example Preview style with green background
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.preview_style(
        #     1,
        #     { css: 'body: { background: green !important; }', }
        #   )
        def preview_style(style, headers: nil, **query)
          rest.post base_url.join('styles', 'preview').url, { style: style }, headers: headers, query: query
        end
      end
    end
  end
end
