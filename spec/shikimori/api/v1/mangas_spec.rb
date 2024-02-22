# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Mangas, :vcr do
  include_context 'with api client'

  describe '#mangas' do
    subject(:mangas) { client.v1.mangas(**params) }

    let(:params) { {} }

    shared_examples 'request to api/mangas' do
      it { is_expected.to be_a(Array) }

      it {
        expect(mangas).to have_requested(
          :get,
          shikimori_url('api/mangas')
        ).with(
          query: params,
          headers: authorization_headers
        )
      }
    end

    context 'when make request without filters' do
      it_behaves_like 'request to api/mangas'
    end

    context 'when request 10 random manga titles released in the 90s' do
      let(:params) { { limit: 10, order: 'random', season: '199x' } }

      it_behaves_like 'request to api/mangas'
    end

    context 'when request top 50 ongoing manga titles' do
      let(:params) { { limit: 50, status: 'ongoing', order: 'ranked' } }

      it_behaves_like 'request to api/mangas'
    end
  end

  describe '#manga' do
    subject(:manga) { client.v1.manga(manga_id) }

    let(:manga_id) { 1 }

    it { is_expected.to be_a(Hash) }
    it { expect(manga).to have_requested(:get, shikimori_url('api/mangas/1')).with(headers: authorization_headers) }

    context 'when manga not exists' do
      let(:manga_id) { 999_999_999_999 }

      it { expect { manga }.to raise_error(Shikimori::API::NotFoundError) }
    end
  end

  describe '#manga_roles' do
    subject(:manga_roles) { client.v1.manga_roles(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(manga_roles).to have_requested(
        :get, shikimori_url('api/mangas/1/roles')
      ).with(headers: authorization_headers)
    }
  end

  describe '#manga_similar' do
    subject(:manga_similar) { client.v1.manga_similar(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(manga_similar).to have_requested(
        :get, shikimori_url('api/mangas/1/similar')
      ).with(headers: authorization_headers)
    }
  end

  describe '#manga_related' do
    subject(:manga_related) { client.v1.manga_related(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(manga_related).to have_requested(
        :get, shikimori_url('api/mangas/1/related')
      ).with(headers: authorization_headers)
    }
  end

  describe '#manga_franchise' do
    subject(:manga_franchise) { client.v1.manga_franchise(1) }

    it { is_expected.to be_a(Hash) }

    it {
      expect(manga_franchise).to have_requested(
        :get, shikimori_url('api/mangas/1/franchise')
      ).with(headers: authorization_headers)
    }
  end

  describe '#manga_external_links' do
    subject(:manga_external_links) { client.v1.manga_external_links(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(manga_external_links).to have_requested(
        :get, shikimori_url('api/mangas/1/external_links')
      ).with(headers: authorization_headers)
    }
  end

  describe '#manga_topics' do
    subject(:manga_topics) { client.v1.manga_topics(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(manga_topics).to have_requested(
        :get, shikimori_url('api/mangas/1/topics')
      ).with(headers: authorization_headers)
    }
  end
end
