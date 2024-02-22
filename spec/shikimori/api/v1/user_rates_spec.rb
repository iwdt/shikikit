# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::UserRates, :vcr do
  include_context 'with api client'

  describe '#user_rate' do
    subject(:request) { client.v1.user_rate(rate_id) }

    let(:rate_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/user_rates/#{rate_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#create_user_rate' do
    subject(:request) { client.v1.create_user_rate(body) }

    let(:body) do
      {
        user_id: 1,
        target_id: 1,
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
        shikimori_url('api/user_rates')
      ).with(
        headers: authorization_headers,
        body: { user_rate: body }.to_json
      )
    }
  end

  describe '#update_user_rate' do
    subject(:request) { client.v1.update_user_rate(user_rate_id, body) }

    let(:user_rate_id) { 1 }
    let(:body) do
      { score: 3, text: 'Some another text' }
    end

    it {
      expect(request).to have_requested(
        :put,
        shikimori_url("api/user_rates/#{user_rate_id}")
      ).with(
        headers: authorization_headers,
        body: { user_rate: body }.to_json
      )
    }
  end

  describe '#delete_user_rate' do
    subject(:request) { client.v1.delete_user_rate(user_rate_id) }

    let(:user_rate_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/user_rates/#{user_rate_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#increment_user_rate' do
    subject(:request) { client.v1.increment_user_rate(user_rate_id) }

    let(:user_rate_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url("api/user_rates/#{user_rate_id}/increment")
      ).with(headers: authorization_headers)
    }
  end

  describe '#cleanup_user_rates' do
    subject(:request) { client.v1.cleanup_user_rates(type) }

    %w[anime manga].each do |type|
      context "when type is #{type}" do
        let(:type) { type }

        it {
          expect(request).to be(true)
          expect(request).to have_requested(
            :delete,
            shikimori_url("api/user_rates/#{type}/cleanup")
          ).with(headers: authorization_headers)
        }
      end
    end
  end

  describe '#reset_user_rates' do
    subject(:request) { client.v1.reset_user_rates(type) }

    %w[anime manga].each do |type|
      context "when type is #{type}" do
        let(:type) { type }

        it {
          expect(request).to be(true)
          expect(request).to have_requested(
            :delete,
            shikimori_url("api/user_rates/#{type}/reset")
          ).with(headers: authorization_headers)
        }
      end
    end
  end
end
