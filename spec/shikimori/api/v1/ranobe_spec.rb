# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Ranobe, :vcr do
  include_context 'with api client'

  describe '#ranobes' do
    subject(:ranobe) { client.v1.ranobes(**params) }

    let(:params) { {} }

    shared_examples 'request to api/ranobe' do
      it { is_expected.to be_a(Array) }

      it {
        expect(ranobe).to have_requested(
          :get,
          shikimori_url('api/ranobe')
        ).with(
          query: params,
          headers: authorization_headers
        )
      }
    end

    context 'when make request without filters' do
      it_behaves_like 'request to api/ranobe'
    end

    context 'when request 10 random ranobe titles released in the 90s' do
      let(:params) { { limit: 10, order: 'random', season: '199x' } }

      it_behaves_like 'request to api/ranobe'
    end

    context 'when request top 50 ongoing ranobe titles' do
      let(:params) { { limit: 50, status: 'ongoing', order: 'ranked' } }

      it_behaves_like 'request to api/ranobe'
    end
  end

  describe '#ranobe' do
    subject(:ranobe) { client.v1.ranobe(ranobe_id) }

    let(:ranobe_id) { 1 }

    it { is_expected.to be_a(Hash) }
    it { expect(ranobe).to have_requested(:get, shikimori_url('api/ranobe/1')).with(headers: authorization_headers) }

    context 'when ranobe not exists' do
      let(:ranobe_id) { 999_999_999_999 }

      it { expect { ranobe }.to raise_error(Shikimori::API::NotFoundError) }
    end
  end

  describe '#ranobe_roles' do
    subject(:ranobe_roles) { client.v1.ranobe_roles(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(ranobe_roles).to have_requested(
        :get, shikimori_url('api/ranobe/1/roles')
      ).with(headers: authorization_headers)
    }
  end

  describe '#ranobe_similar' do
    subject(:ranobe_similar) { client.v1.ranobe_similar(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(ranobe_similar).to have_requested(
        :get, shikimori_url('api/ranobe/1/similar')
      ).with(headers: authorization_headers)
    }
  end

  describe '#ranobe_related' do
    subject(:ranobe_related) { client.v1.ranobe_related(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(ranobe_related).to have_requested(
        :get, shikimori_url('api/ranobe/1/related')
      ).with(headers: authorization_headers)
    }
  end

  describe '#ranobe_franchise' do
    subject(:ranobe_franchise) { client.v1.ranobe_franchise(1) }

    it { is_expected.to be_a(Hash) }

    it {
      expect(ranobe_franchise).to have_requested(
        :get, shikimori_url('api/ranobe/1/franchise')
      ).with(headers: authorization_headers)
    }
  end

  describe '#ranobe_external_links' do
    subject(:ranobe_external_links) { client.v1.ranobe_external_links(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(ranobe_external_links).to have_requested(
        :get, shikimori_url('api/ranobe/1/external_links')
      ).with(headers: authorization_headers)
    }
  end

  describe '#ranobe_topics' do
    subject(:ranobe_topics) { client.v1.ranobe_topics(1) }

    it { is_expected.to be_a(Array) }

    it {
      expect(ranobe_topics).to have_requested(
        :get, shikimori_url('api/ranobe/1/topics')
      ).with(headers: authorization_headers)
    }
  end
end
