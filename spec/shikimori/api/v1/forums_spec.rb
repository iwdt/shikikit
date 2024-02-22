# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Forums, :vcr do
  include_context 'with api client'

  describe '#forums' do
    subject(:request) { client.v1.forums }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get, shikimori_url('api/forums')
      ).with(headers: authorization_headers)
    }
  end
end
