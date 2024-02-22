# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Bans, :vcr do
  include_context 'with api client'

  describe '#bans' do
    subject(:request) { client.v1.bans }

    it { is_expected.to be_a(Array) }
    it { is_expected.to have_requested(:get, shikimori_url('api/bans')).with(headers: authorization_headers) }
  end
end
