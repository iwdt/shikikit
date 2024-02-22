# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Stats, :vcr do
  include_context 'with api client'

  describe '#active_users' do
    subject(:request) { client.v1.active_users }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get, shikimori_url('api/stats/active_users')
      ).with(headers: authorization_headers)
    }
  end
end
