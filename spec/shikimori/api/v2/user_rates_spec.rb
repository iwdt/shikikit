# frozen_string_literal: true

RSpec.describe Shikimori::API::V2::UserRates, :vcr do
  include_context 'with api client'

  let(:anime_id) { 1 }
  let(:user_id) { 1 }
  let(:rate_id) { 1 }

  describe '#user_rate' do
    subject(:request) { client.v2.user_rate(rate_id) }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/v2/user_rates/#{rate_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#create_user_rate' do
    subject(:request) { client.v2.create_user_rate(body) }

    let(:body) do
      {
        user_id: user_id,
        target_id: anime_id,
        target_type: 'Anime',
        status: 'completed',
        score: 1,
        episodes: 13,
        rewatches: 0,
        text: 'Some text'
      }
    end

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/v2/user_rates')
      ).with(
        headers: authorization_headers,
        body: { user_rate: body }.to_json
      )
    }
  end

  describe '#update_user_rate' do
    subject(:request) { client.v2.update_user_rate(rate_id, body) }

    let(:body) do
      { score: 3, text: 'Some another text' }
    end

    it {
      expect(request).to have_requested(
        :put,
        shikimori_url("api/v2/user_rates/#{rate_id}")
      ).with(
        headers: authorization_headers,
        body: { user_rate: body }.to_json
      )
    }
  end

  describe '#delete_user_rate' do
    subject(:request) { client.v2.delete_user_rate(rate_id) }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/v2/user_rates/#{rate_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#increment_user_rate' do
    subject(:request) { client.v2.increment_user_rate(rate_id) }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url("api/v2/user_rates/#{rate_id}/increment")
      ).with(headers: authorization_headers)
    }
  end

  describe '#user_rates' do
    subject(:request) { client.v2.user_rates(**params) }

    let(:params) do
      { page: 1, limit: 2, user_id: 1 }
    end

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url('api/v2/user_rates')
      ).with(headers: authorization_headers, query: params)
    }
  end
end
