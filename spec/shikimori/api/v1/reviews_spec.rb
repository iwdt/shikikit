# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Reviews, :vcr do
  include_context 'with api client'

  describe '#create_review' do
    subject(:request) { client.v1.create_review(body) }

    let(:body) do
      {
        anime_id: 1,
        opinion: 'positive',
        body: 'Some ... long ... text'
      }
    end

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/reviews')
      ).with(
        headers: authorization_headers,
        body: { review: body }.to_json
      )
    }
  end

  describe '#update_review' do
    subject(:request) { client.v1.update_review(review_id, body) }

    let(:review_id) { 1 }
    let(:body) do
      { body: 'Some ... long ... another ... text' }
    end

    it {
      expect(request).to have_requested(
        :put,
        shikimori_url("api/reviews/#{review_id}")
      ).with(
        headers: authorization_headers,
        body: { review: body }.to_json
      )
    }
  end

  describe '#delete_review' do
    subject(:request) { client.v1.delete_review(review_id) }

    let(:review_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/reviews/#{review_id}")
      ).with(headers: authorization_headers)
    }
  end
end
