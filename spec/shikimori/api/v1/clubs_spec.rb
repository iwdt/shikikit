# join_club(id, headers: nil, **query)
# leave_club(id, headers: nil, **query)

# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Clubs, :vcr do
  include_context 'with api client'

  describe '#clubs' do
    subject(:request) { client.v1.clubs(**params) }

    let(:params) { {} }

    it { is_expected.to be_a(Array) }

    context 'without params' do
      it {
        expect(request).to have_requested(
          :get,
          shikimori_url('api/clubs')
        ).with(headers: authorization_headers)
      }
    end

    context 'with params' do
      let(:params) do
        { page: 1,
          limit: 30,
          search: 'api' }
      end

      it {
        expect(request).to have_requested(
          :get,
          shikimori_url('api/clubs')
        ).with(headers: authorization_headers, query: params)
      }
    end
  end

  describe '#club' do
    subject(:request) { client.v1.club(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be_a(Hash) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/clubs/#{club_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#update_club' do
    subject(:request) { client.v1.update_club(club_id, body) }

    let(:club_id) { 5007 }
    let(:body) do
      {
        name: 'Testing club (Shikikit) (test)',
        description: 'test',
        display_images: 'false',
        comment_policy: 'free',
        topic_policy: 'admins',
        image_upload_policy: 'members'
      }
    end

    it {
      expect(request).to have_requested(
        :put,
        shikimori_url("api/clubs/#{club_id}")
      ).with(
        headers: authorization_headers,
        body: { club: body }
      )
    }

    context 'without `clubs` scope' do
      subject(:request) { client.v1.update_club(club_id, body) }

      let(:club_id) { 5007 }
      let(:body) { { name: 'Testing club' } }

      it { expect { request }.to raise_error(Shikimori::API::ForbiddenError) }
    end
  end

  describe '#club_animes' do
    subject(:request) { client.v1.club_animes(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/clubs/#{club_id}/animes")
      ).with(headers: authorization_headers)
    }
  end

  describe '#club_mangas' do
    subject(:request) { client.v1.club_mangas(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/clubs/#{club_id}/mangas")
      ).with(headers: authorization_headers)
    }
  end

  describe '#club_ranobe' do
    subject(:request) { client.v1.club_ranobe(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/clubs/#{club_id}/ranobe")
      ).with(headers: authorization_headers)
    }
  end

  describe '#club_characters' do
    subject(:request) { client.v1.club_characters(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/clubs/#{club_id}/characters")
      ).with(headers: authorization_headers)
    }
  end

  describe '#club_collections' do
    subject(:request) { client.v1.club_collections(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/clubs/#{club_id}/collections")
      ).with(headers: authorization_headers)
    }
  end

  describe '#club_clubs' do
    subject(:request) { client.v1.club_clubs(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/clubs/#{club_id}/clubs")
      ).with(headers: authorization_headers)
    }
  end

  describe '#club_members' do
    subject(:request) { client.v1.club_members(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/clubs/#{club_id}/members")
      ).with(headers: authorization_headers)
    }
  end

  describe '#club_images' do
    subject(:request) { client.v1.club_images(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url("api/clubs/#{club_id}/images")
      ).with(headers: authorization_headers)
    }
  end

  describe '#join_club' do
    subject(:request) { client.v1.join_club(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be(true) }

    it {
      expect(request).to have_requested(
        :post,
        shikimori_url("api/clubs/#{club_id}/join")
      ).with(headers: authorization_headers, body: {})
    }

    context 'without `clubs` scope' do
      it { expect { request }.to raise_error(Shikimori::API::ForbiddenError) }
    end
  end

  describe '#leave_club' do
    subject(:request) { client.v1.leave_club(club_id) }

    let(:club_id) { 1 }

    it { is_expected.to be(true) }

    it {
      expect(request).to have_requested(
        :post,
        shikimori_url("api/clubs/#{club_id}/leave")
      ).with(headers: authorization_headers, body: {})
    }

    context 'without `clubs` scope' do
      it { expect { request }.to raise_error(Shikimori::API::ForbiddenError) }
    end
  end
end
