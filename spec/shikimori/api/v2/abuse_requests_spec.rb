# frozen_string_literal: true

RSpec.describe Shikimori::API::V2::AbuseRequests, :vcr do
  include_context 'with api client'

  let(:comment_id) { 1 }
  let(:reason) { 'test' }

  describe '#abuse_offtopic_request' do
    subject(:request) { client.v2.abuse_offtopic_request({ comment_id: comment_id }) }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/v2/abuse_requests/offtopic')
      ).with(
        headers: authorization_headers,
        body: { comment_id: comment_id }
      )
    }
  end

  describe '#abuse_review_request' do
    subject(:request) { client.v2.abuse_review_request({ comment_id: comment_id }) }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/v2/abuse_requests/convert_review')
      ).with(
        headers: authorization_headers,
        body: { comment_id: comment_id }
      )
    }
  end

  describe '#abuse_request' do
    subject(:request) { client.v2.abuse_request({ comment_id: comment_id, reason: reason }) }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/v2/abuse_requests/abuse')
      ).with(
        headers: authorization_headers,
        body: { comment_id: comment_id, reason: reason }
      )
    }
  end

  describe '#abuse_spoiler_request' do
    subject(:request) { client.v2.abuse_spoiler_request({ comment_id: comment_id, reason: reason }) }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/v2/abuse_requests/spoiler')
      ).with(
        headers: authorization_headers,
        body: { comment_id: comment_id, reason: reason }
      )
    }
  end
end
