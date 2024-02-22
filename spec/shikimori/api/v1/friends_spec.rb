# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Friends, :vcr do
  include_context 'with api client'

  describe '#create_friend' do
    subject(:request) { client.v1.create_friend(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :post,
        shikimori_url("api/friends/#{user_id}")
      ).with(
        headers: authorization_headers
      )
    }
  end

  describe '#delete_friend' do
    subject(:request) { client.v1.delete_friend(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/friends/#{user_id}")
      ).with(headers: authorization_headers)
    }
  end
end
