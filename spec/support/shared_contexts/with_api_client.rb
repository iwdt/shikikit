# frozen_string_literal: true

RSpec.shared_context 'with api client' do
  subject(:client) do
    Shikimori::API::Client.new(
      'https://fakemori.example',
      app_name: 'Api Test',
      access_token: access_token,
      refresh_token: refresh_token
    )
  end

  let(:access_token) { 'FAKE-ACCESS-TOKEN' }
  let(:refresh_token) { 'FAKE-REFRESH-TOKEN' }
  let(:app_name) { 'Api Test' }

  let(:authorization_headers) do
    {
      'Authorization' => "Bearer #{access_token}",
      'User-Agent' => app_name
    }
  end
end
