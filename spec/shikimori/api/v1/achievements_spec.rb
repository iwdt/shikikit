# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Achievements, :vcr do
  include_context 'with api client'

  describe '#achievements' do
    subject(:request) { client.v1.achievements(user_id: user_id) }

    let(:user_id) { 1 }

    it { is_expected.to be_a(Array) }

    it {
      expect(request).to have_requested(
        :get, shikimori_url('api/achievements')
      ).with(headers: authorization_headers, query: { user_id: user_id })
    }

    context 'when user_id have bad format' do
      let(:user_id) { '$bad_format' }

      it {
        expect { request }.to raise_error(
          Shikimori::API::BadRequestError,
          /Bad request. Errors:/
        )
      }
    end
  end
end
