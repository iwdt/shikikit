# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Videos, :vcr do
  include_context 'with api client'

  describe '#anime_videos' do
    subject(:request) { client.v1.anime_videos(anime_id) }

    let(:anime_id) { 1 }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/animes/#{anime_id}/videos")
      ).with(headers: authorization_headers)
    }
  end

  describe '#create_anime_videos' do
    subject(:request) { client.v1.create_anime_video(anime_id, body) }

    let(:anime_id) { 1 }
    let(:body) do
      {
        name: 'Test (soon delete it!)',
        kind: 'ed',
        url: 'https://fakey.be/dQw4w9WgXcQ'
      }
    end

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url("api/animes/#{anime_id}/videos")
      ).with(
        headers: authorization_headers,
        body: { video: body }.to_json
      )
    }
  end

  describe '#delete_anime_video' do
    subject(:request) { client.v1.delete_anime_video(anime_id: anime_id, video_id: video_id) }

    let(:anime_id) { 1 }
    let(:video_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/animes/#{anime_id}/videos/#{video_id}")
      ).with(headers: authorization_headers)
    }
  end
end
