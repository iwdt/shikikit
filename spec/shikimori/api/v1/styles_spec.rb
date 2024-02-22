# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Styles, :vcr do
  include_context 'with api client'

  describe '#style' do
    subject(:request) { client.v1.style(style_id) }

    let(:style_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/styles/#{style_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#create_style' do
    subject(:request) { client.v1.create_style(body) }

    let(:body) do
      {
        css: 'body { background: red; }',
        name: 'Red background',
        owner_id: 1,
        owner_type: 'User'
      }
    end

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/styles')
      ).with(
        headers: authorization_headers,
        body: { style: body }.to_json
      )
    }
  end

  describe '#preview_style' do
    subject(:request) { client.v1.preview_style(body) }

    let(:body) do
      {
        css: 'body { background: green; }'
      }
    end

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/styles/preview')
      ).with(
        headers: authorization_headers,
        body: { style: body }.to_json
      )
    }
  end

  describe '#update_style' do
    subject(:request) { client.v1.update_style(style_id, body) }

    let(:style_id) { 1 }
    let(:body) do
      {
        css: 'body { background: green; }',
        name: 'Green background'
      }
    end

    it {
      expect(request).to have_requested(
        :put,
        shikimori_url("api/styles/#{style_id}")
      ).with(
        headers: authorization_headers,
        body: { style: body }.to_json
      )
    }
  end
end
