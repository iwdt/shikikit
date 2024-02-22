# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Favorites, :vcr do
  include_context 'with api client'

  describe '#create_favorite' do
    subject(:request) { client.v1.create_favorite(favoritable_id, type: favoritable_type, person_type: person_type) }

    let(:favoritable_id) { 1 }
    let(:person_type) { 'person' }

    context 'when add to favorite anime' do
      let(:favoritable_type) { :anime }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url("api/favorites/Anime/#{favoritable_id}")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when add to favorite manga' do
      let(:favoritable_type) { :manga }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url("api/favorites/Manga/#{favoritable_id}")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when add to favorite ranobe' do
      let(:favoritable_type) { :ranobe }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url("api/favorites/Ranobe/#{favoritable_id}")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when add to favorite character' do
      let(:favoritable_type) { :character }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url("api/favorites/Character/#{favoritable_id}")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when add to favorite common person' do
      let(:favoritable_type) { :person }
      let(:person_type) { 'common' }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url("api/favorites/Person/#{favoritable_id}/common")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when add to favorite seyu person' do
      let(:favoritable_type) { :person }
      let(:person_type) { 'seyu' }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url("api/favorites/Person/#{favoritable_id}/seyu")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when add to favorite mangaka person' do
      let(:favoritable_type) { :person }
      let(:person_type) { 'mangaka' }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url("api/favorites/Person/#{favoritable_id}/mangaka")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when add to favorite producer person' do
      let(:favoritable_type) { :person }
      let(:person_type) { 'producer' }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url("api/favorites/Person/#{favoritable_id}/producer")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when add to favorite person' do
      let(:favoritable_type) { :person }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url("api/favorites/Person/#{favoritable_id}/person")
        ).with(
          headers: authorization_headers
        )
      }
    end
  end

  describe '#delete_favorite' do
    subject(:request) { client.v1.delete_favorite(favoritable_id, type: favoritable_type) }

    let(:favoritable_id) { 1 }

    context 'when remove favorite anime' do
      let(:favoritable_type) { :anime }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :delete,
          shikimori_url("api/favorites/Anime/#{favoritable_id}")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when remove favorite manga' do
      let(:favoritable_type) { :manga }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :delete,
          shikimori_url("api/favorites/Manga/#{favoritable_id}")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when remove favorite ranobe' do
      let(:favoritable_type) { :ranobe }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :delete,
          shikimori_url("api/favorites/Ranobe/#{favoritable_id}")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when remove favorite character' do
      let(:favoritable_type) { :character }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :delete,
          shikimori_url("api/favorites/Character/#{favoritable_id}")
        ).with(
          headers: authorization_headers
        )
      }
    end

    context 'when remove favorite person' do
      let(:favoritable_type) { :person }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :delete,
          shikimori_url("api/favorites/Person/#{favoritable_id}")
        ).with(
          headers: authorization_headers
        )
      }
    end
  end

  describe '#reorder_favorite' do
    subject(:request) { client.v1.reorder_favorite(1, position: position) }

    let(:id) { 1 }
    let(:position) { 2 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :post,
        shikimori_url("api/favorites/#{id}/reorder")
      ).with(
        headers: authorization_headers,
        body: { new_index: position }.to_json
      )
    }
  end
end
