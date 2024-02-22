# frozen_string_literal: true

RSpec.describe Shikimori::API::V1::Appear, :vcr do
  include_context 'with api client'

  describe '#create_appear' do
    subject(:request) { client.v1.create_appear(topic_ids: topic_ids, comment_ids: comment_ids) }

    let(:topic_ids) { [1, 2] }
    let(:comment_ids) { [3, 4] }

    it { is_expected.to be(true) }

    it {
      expect(request).to have_requested(
        :post,
        shikimori_url('api/appear')
      ).with(
        body: { ids: 'comment-3,comment-4,topic-1,topic-2' },
        headers: authorization_headers
      )
    }
  end
end
