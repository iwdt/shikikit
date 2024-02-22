# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Messages, :vcr do
  include_context 'with api client'

  describe '#message' do
    subject(:request) { client.v1.message(message_id) }

    let(:message_id) { 1 }

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :get,
        shikimori_url("api/messages/#{message_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#create_message' do
    subject(:request) { client.v1.create_message(body) }

    let(:body) do
      {
        body: 'Test (from shikikit!)',
        from_id: 1,
        to_id: 2,
        type: 'Private'
      }
    end

    it {
      expect(request).to be_a(Hash)
      expect(request).to have_requested(
        :post,
        shikimori_url('api/messages')
      ).with(
        headers: authorization_headers,
        body: { message: body }.to_json
      )
    }
  end

  describe '#update_message' do
    subject(:request) { client.v1.update_message(message_id, body) }

    let(:message_id) { 1 }
    let(:body) do
      { body: 'Testing comment (Shikikit) (test). UPD!' }
    end

    it {
      expect(request).to have_requested(
        :put,
        shikimori_url("api/messages/#{message_id}")
      ).with(
        headers: authorization_headers,
        body: { message: body }.to_json
      )
    }
  end

  describe '#delete_message' do
    subject(:request) { client.v1.delete_message(message_id) }

    let(:message_id) { 1 }

    it {
      expect(request).to be(true)
      expect(request).to have_requested(
        :delete,
        shikimori_url("api/messages/#{message_id}")
      ).with(headers: authorization_headers)
    }
  end

  describe '#read_all_messages' do
    subject(:request) { client.v1.read_all_messages(type: type) }

    context 'when type is news' do
      let(:type) { :news }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url('api/messages/read_all')
        ).with(
          headers: authorization_headers,
          body: { type: type }.to_json
        )
      }
    end

    context 'when type is notifications' do
      let(:type) { :notifications }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url('api/messages/read_all')
        ).with(
          headers: authorization_headers,
          body: { type: type }.to_json
        )
      }
    end
  end

  describe '#delete_all_messages' do
    subject(:request) { client.v1.delete_all_messages(type: type) }

    context 'when type is news' do
      let(:type) { :news }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url('api/messages/delete_all')
        ).with(
          headers: authorization_headers,
          body: { type: type }.to_json
        )
      }
    end

    context 'when type is notifications' do
      let(:type) { :notifications }

      it {
        expect(request).to be(true)
        expect(request).to have_requested(
          :post,
          shikimori_url('api/messages/delete_all')
        ).with(
          headers: authorization_headers,
          body: { type: type }.to_json
        )
      }
    end
  end
end
