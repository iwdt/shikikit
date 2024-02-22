# frozen_string_literal: true

RSpec.describe Shikimori::API::V2::UserIgnore, :vcr do
  include_context 'with api client'

  describe '#create_user_ignore' do
    subject(:request) { client.v2.create_user_ignore(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url("api/v2/users/#{user_id}/ignore")
      ).with(
        headers: authorization_headers
      )
    }
  end

  describe '#delete_user_ignore' do
    subject(:request) { client.v2.delete_user_ignore(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/v2/users/#{user_id}/ignore")
      ).with(headers: authorization_headers)
    }
  end
end
