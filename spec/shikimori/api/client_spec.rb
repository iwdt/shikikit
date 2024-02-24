# frozen_string_literal: true

RSpec.describe Shikimori::API::Client do
  describe '#as_app' do
    it 'yields the client object' do
      described_class.as_app do |client|
        expect(client).to be_an_instance_of(described_class)
      end
    end
  end
end
