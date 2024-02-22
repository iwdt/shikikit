# frozen_string_literal: true

RSpec.describe Shikimori::OAuth2::Client do
  subject(:client) { described_class.new(client_id, client_secret, app_name: app_name) }

  let(:client_id) { 'your_client_id' }
  let(:client_secret) { 'your_client_secret' }
  let(:app_name) { 'YourApp' }
  let(:config) { Shikimori::OAuth2::Config.new }

  describe '#initialize' do
    it 'sets the app name' do
      expect(client.instance_variable_get(:@app_name)).to eq(app_name)
    end

    it { is_expected.to be_a(OAuth2::Client) }
  end

  describe '#authorize_url' do
    subject(:authorize_url) { client.authorize_url(scope: scope) }

    let(:scope) { 'read+write' }

    it 'replaces encoded scope with plus sign' do
      expect(authorize_url).to eq('https://shikimori.one/oauth/authorize?scope=read+write')
    end
  end

  describe '#get_token' do
    before do
      stub_request(:post, 'https://shikimori.one/oauth/token')
        .to_return(
          status: 200,
          body: JSON.dump({ access_token: 'fake' }),
          headers: { 'Content-Type' => 'application/json' }
        )

      client.get_token({})
    end

    it 'request token with proper User-Agent header' do
      expect(WebMock).to have_requested(:post, 'https://shikimori.one/oauth/token')
        .with(headers: { 'User-Agent' => app_name }).once
    end
  end
end
