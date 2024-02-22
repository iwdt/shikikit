# frozen_string_literal: true

RSpec.describe Shikimori::API::V2::EpisodeNotifications, :vcr do
  include_context 'with api client'

  describe '#create_episode_notification' do
    subject(:request) { client.v2.create_episode_notification(body, token: token) }

    let(:token) { 'fake-integration-token' }
    let(:body) do
      {
        anime_id: 1,
        episode: 1,
        aired_at: '2022-11-19T17:19:31+03:00',
        is_fandub: 'true',
        is_raw: 'false',
        is_subtitles: 'true',
        is_anime365: 'false'
      }
    end

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/v2/episode_notifications')
      ).with(
        headers: authorization_headers,
        body: { episode_notification: body, token: token }
      )
    }
  end
end
