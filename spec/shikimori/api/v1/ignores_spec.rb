# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Ignores, :vcr do
  include_context 'with api client'

  describe '#create_ignore' do
    subject(:request) { client.v1.create_ignore(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :post,
        shikimori_url("api/ignores/#{user_id}")
      ).with(
        headers: authorization_headers
      )
    }
  end

  describe '#delete_ignore' do
    subject(:request) { client.v1.delete_ignore(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/ignores/#{user_id}")
      ).with(headers: authorization_headers)
    }
  end
end
