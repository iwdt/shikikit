# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::TopicIgnores, :vcr do
  include_context 'with api client'

  describe '#create_topic_ignore' do
    subject(:request) { client.v1.create_topic_ignore(topic_id: topic_id, user_id: user_id) }

    let(:user_id) { 1 }
    let(:topic_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/topic_ignores')
      ).with(
        headers: authorization_headers,
        body: { topic_ignore: { topic_id: topic_id, user_id: user_id } }
      )
    }
  end

  describe '#delete_topic_ignore' do
    subject(:request) { client.v1.delete_topic_ignore(topic_ignore_id) }

    let(:topic_ignore_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/topic_ignores/#{topic_ignore_id}")
      ).with(headers: authorization_headers)
    }
  end
end
