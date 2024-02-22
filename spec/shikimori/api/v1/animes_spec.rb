# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Animes, :vcr do
  include_context 'with api client'

  describe '#animes' do
    subject(:animes) { client.v1.animes(**params) }

    let(:params) { {} }

    shared_examples 'request to api/animes' do
      it { is_expected.to be_a(Array) }

      it {
        expect(animes).to have_requested(
          :get,
          shikimori_url('api/animes')
        ).with(
          query: params,
          headers: authorization_headers
        )
      }
    end

    context 'when make request without filters' do
      it_behaves_like 'request to api/animes'
    end

    context 'when request 10 random anime titles released in the 90s' do
      let(:params) { { limit: 10, order: 'random', season: '199x' } }

      it_behaves_like 'request to api/animes'
    end

    context 'when request top 50 ongoing anime titles' do
      let(:params) { { limit: 50, status: 'ongoing', order: 'ranked' } }

      it_behaves_like 'request to api/animes'
    end
  end

  describe '#anime' do
    subject(:anime) { client.v1.anime(anime_id) }

    let(:anime_id) { 1 }

    it { is_expected.to be_a(Hash) }
    it { expect(anime).to have_requested(:get, shikimori_url('api/animes/1')).with(headers: authorization_headers) }

    context 'when anime not exists' do
      let(:anime_id) { 999_999_999_999 }

      it { expect { anime }.to raise_error(Shikimori::API::NotFoundError) }
    end
  end

  describe '#anime_roles' do
    subject(:anime_roles) { client.v1.anime_roles(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(anime_roles).to have_requested(
        :get, shikimori_url('api/animes/1/roles')
      ).with(headers: authorization_headers)
    }
  end

  describe '#anime_similar' do
    subject(:anime_similar) { client.v1.anime_similar(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(anime_similar).to have_requested(
        :get, shikimori_url('api/animes/1/similar')
      ).with(headers: authorization_headers)
    }
  end

  describe '#anime_related' do
    subject(:anime_related) { client.v1.anime_related(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(anime_related).to have_requested(
        :get, shikimori_url('api/animes/1/related')
      ).with(headers: authorization_headers)
    }
  end

  describe '#anime_screenshots' do
    subject(:anime_screenshots) { client.v1.anime_screenshots(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(anime_screenshots).to have_requested(
        :get, shikimori_url('api/animes/1/screenshots')
      ).with(headers: authorization_headers)
    }
  end

  describe '#anime_franchise' do
    subject(:anime_franchise) { client.v1.anime_franchise(1) }

    it { is_expected.to be_a(Hash) }

    it {
      expect(anime_franchise).to have_requested(
        :get, shikimori_url('api/animes/1/franchise')
      ).with(headers: authorization_headers)
    }
  end

  describe '#anime_external_links' do
    subject(:anime_external_links) { client.v1.anime_external_links(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(anime_external_links).to have_requested(
        :get, shikimori_url('api/animes/1/external_links')
      ).with(headers: authorization_headers)
    }
  end

  describe '#anime_topics' do
    subject(:anime_topics) { client.v1.anime_topics(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(anime_topics).to have_requested(
        :get, shikimori_url('api/animes/1/topics')
      ).with(headers: authorization_headers)
    }
  end
end
