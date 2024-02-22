# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Studios, :vcr do
  include_context 'with api client'

  describe '#studios' do
    subject(:request) { client.v1.studios }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get, shikimori_url('api/studios')
      ).with(headers: authorization_headers)
    }
  end
end
