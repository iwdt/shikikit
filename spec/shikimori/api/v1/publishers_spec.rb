# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Publishers, :vcr do
  include_context 'with api client'

  describe '#publishers' do
    subject(:request) { client.v1.publishers }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get, shikimori_url('api/publishers')
      ).with(headers: authorization_headers)
    }
  end
end
