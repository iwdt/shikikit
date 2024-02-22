# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the User images API
      #
      # @see https://shikimori.one/api/doc/1.0/user_images Shikimori's API documentation
      module UserImages
        # Create User image.
        # Requires `comments` oauth scope
        #
        # @param image [File] Image file
        # @param linked_type ['Comment'] Linking type
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created user image
        #
        # @see https://shikimori.one/api/doc/1.0/user_images/create Shikimori's API documentation
        # @example Create user's image
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.create_user_image(File.open('/tmp/file.jpg'), linked_type: 'Comment')
        def create_user_image(image, linked_type: nil, headers: nil, **query)
          rest.post base_url.join('user_images').url,
                    { 'image' => image, 'linked_type' => linked_type }.compact,
                    headers: headers, query: query, as_form: true
        end
      end
    end
  end
end
