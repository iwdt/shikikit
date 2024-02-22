# frozen_string_literal: true

require_relative 'v1/achievements'
require_relative 'v1/animes'
require_relative 'v1/appear'
require_relative 'v1/bans'
require_relative 'v1/calendars'
require_relative 'v1/characters'
require_relative 'v1/clubs'
require_relative 'v1/comments'
require_relative 'v1/constants'
require_relative 'v1/dialogs'
require_relative 'v1/favorites'
require_relative 'v1/forums'
require_relative 'v1/friends'
require_relative 'v1/genres'
require_relative 'v1/ignores'
require_relative 'v1/mangas'
require_relative 'v1/messages'
require_relative 'v1/people'
require_relative 'v1/publishers'
require_relative 'v1/ranobe'
require_relative 'v1/reviews'
require_relative 'v1/stats'
require_relative 'v1/studios'
require_relative 'v1/styles'
require_relative 'v1/topic_ignores'
require_relative 'v1/topics'
require_relative 'v1/user_images'
require_relative 'v1/user_rates'
require_relative 'v1/users'
require_relative 'v1/videos'

module Shikimori
  module API
    # Methods for first version of shikimori's API
    class V1
      include Achievements
      include Animes
      include Appear
      include Bans
      include Calendars
      include Characters
      include Clubs
      include Comments
      include Constants
      include Dialogs
      include Favorites
      include Forums
      include Friends
      include Genres
      include Ignores
      include Mangas
      include Messages
      include People
      include Publishers
      include Ranobe
      include Reviews
      include Stats
      include Studios
      include Styles
      include TopicIgnores
      include Topics
      include UserImages
      include UserRates
      include Users
      include Videos

      attr_reader :rest, :base_url

      def initialize(base_url:, rest:)
        @rest = rest
        @base_url = base_url
      end
    end
  end
end
