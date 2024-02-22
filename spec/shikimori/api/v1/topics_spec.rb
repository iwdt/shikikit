# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Topics, :vcr do
  include_context 'with api client'

  describe '#topics' do
    subject(:request) { client.v1.topics(**params) }

    context 'without params' do
      let(:params) { {} }

      it {
        expect(request).to be_a(Array)
        expect(request).to have_requested(
          :get, shikimori_url('api/topics')
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'with params' do
      Shikimori::API::V1::Topics::TOPIC_TYPES_MAP.each do |type, type_value|
        context "when type equal to #{type}" do
          let(:params) do
            {
              type: type,
              page: 1,
              limit: 2
            }
          end

          it {
            expect(request).to be_a(Array)
            expect(request).to have_requested(
              :get, shikimori_url('api/topics')
            ).with(
              headers: authorization_headers,
              query: { type: type_value, page: 1, limit: 2 }
            )
          }
        end
      end

      context 'with filter by first anime' do
        let(:params) do
          {
            page: 1,
            limit: 2,
            linked_type: 'Anime',
            linked_id: 1
          }
        end

        it {
          expect(request).to be_a(Array)
          expect(request).to have_requested(
            :get, shikimori_url('api/topics')
          ).with(
            headers: authorization_headers,
            query: params
          )
        }
      end
    end
  end

  describe '#topic' do
    subject(:request) { client.v1.topic(topic_id) }

    let(:topic_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/topics/#{topic_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#create_topic' do
    subject(:request) { client.v1.create_topic(body) }

    let(:body) do
      {
        title: 'Тестовый топик для shikikit',
        type: 'Topic',
        body: 'тест',
        forum_id: 8,
        user_id: 1
      }
    end

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/topics')
      ).with(
        headers: authorization_headers,
        body: { topic: body }.to_json
      )
    }
  end

  describe '#update_topic' do
    subject(:request) { client.v1.update_topic(topic_id, body) }

    let(:topic_id) { 1 }
    let(:body) do
      {
        title: 'Тестовый топик для shikikit (UPD)',
        body: 'test(upd)'
      }
    end

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :put,
        shikimori_url("api/topics/#{topic_id}")
      ).with(
        headers: authorization_headers,
        body: { topic: body }.to_json
      )
    }
  end

  describe '#delete_topic' do
    subject(:request) { client.v1.delete_topic(topic_id) }

    let(:topic_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/topics/#{topic_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#topics_updates' do
    subject(:request) { client.v1.topics_updates(limit: 2) }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get, shikimori_url('api/topics/updates')
      ).with(headers: authorization_headers, query: { limit: 2 })
    }
  end

  describe '#hot_topics' do
    subject(:request) { client.v1.hot_topics(limit: 2) }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get, shikimori_url('api/topics/hot')
      ).with(headers: authorization_headers, query: { limit: 2 })
    }
  end
end
