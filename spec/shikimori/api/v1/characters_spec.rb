# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Characters, :vcr do
  include_context 'with api client'

  describe '#characters' do
    subject(:request) { client.v1.characters }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url('api/characters/search')
      ).with(headers: authorization_headers)
    }
  end

  describe '#character' do
    subject(:request) { client.v1.character(character_id) }

    let(:character_id) { 1 }

    it { is_expected.to be_a(Hash) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/characters/#{character_id}")
      ).with(headers: authorization_headers)
    }
  end
end
