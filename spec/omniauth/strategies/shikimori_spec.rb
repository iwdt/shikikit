# frozen_string_literal: true

OmniAuth.config.logger = Logger.new('/dev/null')

RSpec.describe OmniAuth::Strategies::Shikimori, type: :strategy do
  let(:client_id) { 'fake-client-id' }
  let(:client_secret) { 'fake-client-secret' }
  let(:user_info) do
    {
      'id' => 1,
      'nickname' => '=fake_name=',
      'avatar' => 'https://fake.fshikifake.fake/system/users/x48/123.png?1234567890',
      'image' => {
        'x160' => 'https://fake.shikifake.fake/system/users/x160/123.png?1234567890',
        'x148' => 'https://fake.shikifake.fake/system/users/x148/123.png?1234567890',
        'x80' => 'https://fake.shikifake.fake/system/users/x80/123.png?1234567890',
        'x64' => 'https://fake.shikifake.fake/system/users/x64/123.png?1234567890',
        'x48' => 'https://fake.shikifake.fake/system/users/x48/123.png?1234567890',
        'x32' => 'https://fake.shikifake.fake/system/users/x32/123.png?1234567890',
        'x16' => 'https://fake.shikifake.fake/system/users/x16/123.png?1234567890'
      },
      'last_online_at' => '2000-01-01T00:00:00.001+03:00',
      'url' => 'https://shikifake.fake/=fake_name=',
      'name' => 'Fake Fakeov',
      'sex' => 'male',
      'website' => 'https://fake.fake/',
      'birth_on' => '1800-01-01',
      'full_years' => 200,
      'locale' => 'ru'
    }
  end

  shared_examples 'a #info method' do
    subject(:info) { shikimori.info }

    let(:raw_info) { shikimori.raw_info }
    let(:info_uri) { URI.join(shikimori.client.site, described_class::USER_INFO_PATH) }
    let(:access_token) { instance_double(OAuth2::AccessToken, :options => {}, :[] => 'user') }

    before do
      allow(shikimori).to receive(:access_token).and_return(access_token)
      allow(access_token).to receive(:get).with(info_uri).and_return instance_double(
        OAuth2::Response,
        parsed: user_info
      )
    end

    it { expect(info).not_to be_nil }

    describe '#nickname' do
      it { expect(info[:nickname]).to eq(user_info['nickname']) }
    end

    describe '#name' do
      it { expect(info[:name]).to eq(user_info['name']) }
    end

    describe '#gender' do
      it { expect(info[:gender]).to eq(user_info['sex']) }
    end

    describe '#locale' do
      it { expect(info[:locale]).to eq(user_info['locale']) }
    end

    describe '#avatar_url' do
      it { expect(info[:avatar_url]).to eq(user_info['avatar']) }
    end

    describe '#website' do
      it { expect(info[:website]).to eq(user_info['website']) }
    end

    describe '#birthday' do
      it { expect(info[:birthday]).to eq(user_info['birth_on']) }
    end

    describe '#urls' do
      it { expect(info[:urls]).to eq({ shikimori: user_info['url'] }) }
    end
  end

  context 'when providing options' do
    subject(:shikimori) do
      described_class.new(
        client_id,
        client_secret,
        {
          scope: scope,
          app_name: app_name,
          client_options: { site: site }
        }
      )
    end

    let(:site) { 'https://shikimori.fake' }
    let(:scope) { %w[fake scope] }
    let(:app_name) { 'Fake APP' }

    describe '#options' do
      subject(:options) { shikimori.options }

      describe '#client_options' do
        subject(:client_options) { options.client_options }

        specify('#site') { expect(client_options.site).to eq(site) }
      end

      specify('#scope') { expect(shikimori.options.scope).to eq(scope) }
      specify('#app_name') { expect(shikimori.options.app_name).to eq(app_name) }
    end

    describe '#info' do
      include_examples 'a #info method'
    end
  end

  context 'when not providing options' do
    subject(:shikimori) { described_class.new(client_id, client_secret) }

    describe '#options' do
      subject(:options) { shikimori.options }

      describe '#client_options' do
        subject(:client_options) { options.client_options }

        specify('#site') { expect(client_options.site).to eq(Shikimori::OAuth2::Config::DEFAULT_SITE_URL) }
      end

      specify('#app_name') { expect(shikimori.options.app_name).to eq(Shikimori::OAuth2::Config::DEFAULT_APP_NAME) }
    end

    describe '#info' do
      include_examples 'a #info method'
    end
  end
end
