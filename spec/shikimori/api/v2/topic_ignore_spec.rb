# frozen_string_literal: true

RSpec.describe Shikimori::API::V2::TopicIgnore, :vcr do
  include_context 'with api client'

  describe '#create_topic_ignore' do
    subject(:request) { client.v2.create_topic_ignore(topic_id) }

    let(:topic_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url("api/v2/topics/#{topic_id}/ignore")
      ).with(
        headers: authorization_headers
      )
    }
  end

  describe '#delete_topic_ignore' do
    subject(:request) { client.v2.delete_topic_ignore(topic_id) }

    let(:topic_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/v2/topics/#{topic_id}/ignore")
      ).with(headers: authorization_headers)
    }
  end
end
