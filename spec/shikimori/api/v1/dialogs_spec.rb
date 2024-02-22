# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Dialogs, :vcr do
  include_context 'with api client'

  describe '#dialogs' do
    subject(:request) { client.v1.dialogs(**params) }

    let(:params) do
      {
        page: 1,
        limit: 10
      }
    end

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url('api/dialogs')
      ).with(headers: authorization_headers, query: params)
    }
  end

  describe '#dialog' do
    subject(:request) { client.v1.dialog(username, **params) }

    let(:username) { 'user-1' }
    let(:params) do
      {
        page: 1,
        limit: 10
      }
    end

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/dialogs/#{username}")
      ).with(headers: authorization_headers, query: params)
    }
  end

  describe '#delete_dialog' do
    subject(:request) { client.v1.delete_dialog(username) }

    let(:username) { 'user-1' }

    it { is_expected.to be(true) }

    it {
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/dialogs/#{username}")
      ).with(headers: authorization_headers)
    }
  end
end
