# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::UserImages, :vcr do
  include_context 'with api client'

  describe '#create_user_image' do
    subject(:request) { client.v1.create_user_image(file) }

    let(:file) { File.open File.expand_path('../../../fixtures/lorem.jpg', __dir__) }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/user_images')
      ).with(
        headers: authorization_headers
      )
    }
  end
end
