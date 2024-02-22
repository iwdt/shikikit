# frozen_string_literal: true

RSpec.describe Shikimori::OAuth2 do
  describe '#config' do
    subject { described_class.config }

    it { is_expected.to be_an_instance_of(Shikimori::OAuth2::Config) }
  end

  describe '#configure' do
    it 'yields the configuration object' do
      described_class.configure do |config|
        expect(config).to be_an_instance_of(Shikimori::OAuth2::Config)
      end
    end
  end
end
