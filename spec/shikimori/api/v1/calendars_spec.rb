# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Calendars, :vcr do
  include_context 'with api client'

  describe '#calendar' do
    subject(:request) { client.v1.calendar }

    it { is_expected.to be_a(Array) }
    it { is_expected.to have_requested(:get, shikimori_url('api/calendar')).with(headers: authorization_headers) }
  end
end
