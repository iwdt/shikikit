# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Genres, :vcr do
  include_context 'with api client'

  describe '#genres' do
    subject(:request) { client.v1.genres }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get, shikimori_url('api/genres')
      ).with(headers: authorization_headers)
    }
  end
end
