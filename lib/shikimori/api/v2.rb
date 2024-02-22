# frozen_string_literal: true

require_relative 'v2/abuse_requests'
require_relative 'v2/episode_notifications'
require_relative 'v2/topic_ignore'
require_relative 'v2/user_ignore'
require_relative 'v2/user_rates'

module Shikimori
  module API
    # Methods for second version of shikimori's API
    class V2
      include AbuseRequests
      include EpisodeNotifications
      include TopicIgnore
      include UserIgnore
      include UserRates

      attr_reader :rest, :base_url

      def initialize(base_url:, rest:)
        @rest = rest
        @base_url = base_url
      end
    end
  end
end
