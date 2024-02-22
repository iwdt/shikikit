# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Constants, :vcr do
  include_context 'with api client'

  describe '#anime_constants' do
    subject(:request) { client.v1.anime_constants }

    it { is_expected.to be_a(Hash) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url('api/constants/anime')
      ).with(headers: authorization_headers)
    }
  end

  describe '#manga_constants' do
    subject(:request) { client.v1.manga_constants }

    it { is_expected.to be_a(Hash) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url('api/constants/manga')
      ).with(headers: authorization_headers)
    }
  end

  describe '#user_rate_constants' do
    subject(:request) { client.v1.user_rate_constants }

    it { is_expected.to be_a(Hash) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url('api/constants/user_rate')
      ).with(headers: authorization_headers)
    }
  end

  describe '#club_constants' do
    subject(:request) { client.v1.club_constants }

    it { is_expected.to be_a(Hash) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url('api/constants/club')
      ).with(headers: authorization_headers)
    }
  end

  describe '#smileys_constants' do
    subject(:request) { client.v1.smileys_constants }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get,
        shikimori_url('api/constants/smileys')
      ).with(headers: authorization_headers)
    }
  end
end
