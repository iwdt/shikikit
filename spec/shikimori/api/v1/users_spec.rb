# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Users, :vcr do
  include_context 'with api client'

  describe '#users' do
    subject(:request) { client.v1.users(**params) }

    let(:params) do
      {
        page: 1,
        limit: 2,
        search: 'shikikit'
      }
    end

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url('api/users')
      ).with(headers: authorization_headers, query: params)
    }
  end

  describe '#user' do
    subject(:request) { client.v1.user(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(:get, shikimori_url("api/users/#{user_id}"))
        .with(headers: authorization_headers)
    }
  end

  describe '#user_info' do
    subject(:request) { client.v1.user_info(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(:get, shikimori_url("api/users/#{user_id}/info"))
        .with(headers: authorization_headers)
    }
  end

  describe '#whoami' do
    subject(:request) { client.v1.whoami }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(:get, shikimori_url('api/users/whoami'))
        .with(headers: authorization_headers)
    }
  end

  describe '#user_friends' do
    subject(:request) { client.v1.user_friends(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/users/#{user_id}/friends")
      ).with(headers: authorization_headers)
    }
  end

  describe '#user_clubs' do
    subject(:request) { client.v1.user_clubs(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/users/#{user_id}/clubs")
      ).with(headers: authorization_headers)
    }
  end

  describe '#user_anime_rates' do
    subject(:request) { client.v1.user_anime_rates(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/users/#{user_id}/anime_rates")
      ).with(headers: authorization_headers)
    }
  end

  describe '#user_manga_rates' do
    subject(:request) { client.v1.user_manga_rates(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/users/#{user_id}/manga_rates")
      ).with(headers: authorization_headers)
    }
  end

  describe '#user_history' do
    subject(:request) { client.v1.user_history(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/users/#{user_id}/history")
      ).with(headers: authorization_headers)
    }
  end

  describe '#user_bans' do
    subject(:request) { client.v1.user_bans(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/users/#{user_id}/bans")
      ).with(headers: authorization_headers)
    }
  end

  describe '#user_favorites' do
    subject(:request) { client.v1.user_favorites(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/users/#{user_id}/favourites")
      ).with(headers: authorization_headers)
    }
  end

  describe '#user_messages' do
    subject(:request) { client.v1.user_messages(user_id, type: 'news') }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Array)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/users/#{user_id}/messages")
      ).with(headers: authorization_headers, query: { type: 'news' })
    }
  end

  describe '#user_unread_messages' do
    subject(:request) { client.v1.user_unread_messages(user_id) }

    let(:user_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/users/#{user_id}/unread_messages")
      ).with(headers: authorization_headers)
    }
  end

  describe '#sign_out' do
    subject(:request) { client.v1.sign_out }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :get,
        shikimori_url('api/users/sign_out')
      ).with(headers: authorization_headers)
    }
  end
end
