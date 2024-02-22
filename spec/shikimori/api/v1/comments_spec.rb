# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Comments, :vcr do
  include_context 'with api client'

  describe '#comments' do
    subject(:request) { client.v1.comments(**params) }

    context 'without params' do
      let(:params) { {} }

      it { expect { request }.to raise_error(Shikimori::API::RequestError) }
    end

    context 'with params' do
      let(:params) do
        {
          page: 1,
          limit: 2,
          commentable_id: '1',
          commentable_type: 'User'
        }
      end

      it { is_expected.to be_a(Array) }

      it {
        expect(request).to have_requested(
          :get,
          shikimori_url('api/comments')
        ).with(headers: authorization_headers, query: params)
      }
    end
  end

  describe '#comment' do
    subject(:request) { client.v1.comment(comment_id) }

    let(:comment_id) { 1 }

    it { is_expected.to be_a(Hash) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/comments/#{comment_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#create_comment' do
    subject(:request) { client.v1.create_comment(body) }

    let(:body) do
      {
        body: 'Test (from shikikit!)',
        commentable_id: 1,
        commentable_type: 'Topic',
        is_offtopic: 'true'
      }
    end

    it {
      expect(request).to have_requested(
        :post,
        shikimori_url('api/comments')
      ).with(
        headers: authorization_headers,
        body: { comment: body }.to_json
      )
    }
  end

  describe '#update_comment' do
    subject(:request) { client.v1.update_comment(comment_id, body) }

    let(:comment_id) { 1 }
    let(:body) do
      { body: 'Testing comment (Shikikit) (test). UPD!' }
    end

    it {
      expect(request).to have_requested(
        :put,
        shikimori_url("api/comments/#{comment_id}")
      ).with(
        headers: authorization_headers,
        body: { comment: body }.to_json
      )
    }
  end

  describe '#delete_comment' do
    subject(:request) { client.v1.delete_comment(comment_id) }

    let(:comment_id) { 1 }

    it { is_expected.to be(true) }

    it {
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/comments/#{comment_id}")
      ).with(headers: authorization_headers)
    }
  end
end
