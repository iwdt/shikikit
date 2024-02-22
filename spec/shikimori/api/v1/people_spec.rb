# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::People, :vcr do
  include_context 'with api client'

  describe '#people' do
    subject(:request) { client.v1.people(**params) }

    let(:params) do
      {
        page: 1,
        limit: 10,
        kind: 'mangaka',
        search: 'ISIN NISIO'
      }
    end

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url('api/people/search')
      ).with(headers: authorization_headers, query: params)
    }
  end

  describe '#person' do
    subject(:request) { client.v1.person(id) }

    let(:id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/people/#{id}")
      ).with(headers: authorization_headers)
    }
  end
end
