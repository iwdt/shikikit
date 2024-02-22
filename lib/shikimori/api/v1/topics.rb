# frozen_string_literal: true

module Shikimori
  module API
    class V1
      # Methods for the Topics API
      #
      # @see https://shikimori.one/api/doc/1.0/topics Shikimori's API documentation
      module Topics
        TOPIC_TYPES_MAP = {
          'topic' => 'Topic',
          'club_user' => 'Topics::ClubUserTopic',
          'entry_topic' => 'Topics::EntryTopic',
          'anime' => 'Topics::EntryTopics::AnimeTopic',
          'article' => 'Topics::EntryTopics::ArticleTopic',
          'character' => 'Topics::EntryTopics::CharacterTopic',
          'club_page' => 'Topics::EntryTopics::ClubPageTopic',
          'club' => 'Topics::EntryTopics::ClubTopic',
          'collection' => 'Topics::EntryTopics::CollectionTopic',
          'contest' => 'Topics::EntryTopics::ContestTopic',
          'cosplay_gallery' => 'Topics::EntryTopics::CosplayGalleryTopic',
          'manga' => 'Topics::EntryTopics::MangaTopic',
          'person' => 'Topics::EntryTopics::PersonTopic',
          'ranobe' => 'Topics::EntryTopics::RanobeTopic',
          'critique' => 'Topics::EntryTopics::CritiqueTopic',
          'review' => 'Topics::EntryTopics::ReviewTopic',
          'news' => 'Topics::NewsTopic',
          'contest_status' => 'Topics::NewsTopics::ContestStatusTopic'
        }.freeze

        # Get list of topics
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 30
        # @option query ['all', 'animanga', 'site',
        #   'games', 'vn', 'contests',
        #   'offtopic', 'clubs', 'my_clubs',
        #   'critiques', 'news', 'collections',
        #   'articles', 'cosplay'] :forum Forum type
        # @option query [Integer] :linked_id Linked object ID
        # @option query ['Anime', 'Manga', 'Ranobe',
        #   'Character', 'Person', 'Club',
        #   'ClubPage', 'Critique', 'Review',
        #   'Contest', 'CosplayGallery',
        #   'Collection', 'Article'] :linked_type Linked object type
        # @option query ['topic', 'club_user', 'entry_topic',
        #   'anime', 'article', 'character',
        #   'club_page', 'club', 'collection',
        #   'contest', 'cosplay_gallery', 'manga',
        #   'person', 'ranobe', 'critique',
        #   'review', 'news', 'contest_status'] :type Type of topic
        #
        # @return [Array<Hash>] Array of hashes representing topics
        #
        # @see https://shikimori.one/api/doc/1.0/topics/index Shikimori's API documentation
        # @example Get list of topics
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.topics #=> [{ id: 1, ... }, ...]
        def topics(type: nil, headers: nil, **query)
          topic_type = type && TOPIC_TYPES_MAP[type]

          rest.get base_url.join('topics').url, headers: headers, query: query.merge(
            type: topic_type
          ).compact
        end

        # Get an topic by id
        #
        # @param id [#to_s] Topic id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing topic
        #
        # @see https://shikimori.one/api/doc/1.0/topics/show Shikimori's API documentation
        # @example Get topic with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.topic(1) #=> { id: 1, ... }
        def topic(id, headers: nil, **query)
          rest.get base_url.join('topics', id.to_s).url, headers: headers, query: query
        end

        # Create a topic.
        # Requires `topics` oauth scope
        #
        # @param topic [Hash] Topic data for creating
        # @option topic [String] :title Topic title
        # @option topic ['Topic'] :type Topic type
        # @option topic [String] :body Topic text
        # @option topic [Integer] :forum_id ID of forum
        # @option topic [Integer] :user_id ID of user created a topic
        # @option topic [Integer] :linked_id ID of linked object to topic
        # @option topic ['Anime', 'Manga', 'Ranobe',
        #   'Character', 'Person', 'Club',
        #   'ClubPage', 'Critique', 'Review',
        #   'Contest', 'CosplayGallery',
        #   'Collection', 'Article'] :linked_type Type of linked object to topic
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing created topic
        #
        # @see https://shikimori.one/api/doc/1.0/topics/create Shikimori's API documentation
        # @example Create a topic
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   topic = {
        #     body: "text",
        #     forum_id: "1",
        #     linked_id: "41",
        #     linked_type: "Anime",
        #     title: "zxc",
        #     type: "Topic",
        #     user_id: "23456791"
        #   }
        #   client.v1.create_topic(topic)
        def create_topic(topic, headers: nil, **query)
          rest.post(
            base_url.join('topics').url,
            { topic: topic }.compact,
            headers: headers, query: query
          )
        end

        # Update Topic
        # Requires `topics` oauth scope
        #
        # @param id [#to_s] Topic id
        # @param topic [Hash] Topic data for updating
        # @option topic [String] :title Topic title
        # @option topic [String] :body Topic text
        # @option topic [Integer] :linked_id ID of linked object to topic
        # @option topic ['Anime', 'Manga', 'Ranobe',
        #   'Character', 'Person', 'Club',
        #   'ClubPage', 'Critique', 'Review',
        #   'Contest', 'CosplayGallery',
        #   'Collection', 'Article'] :linked_type Type of linked object to topic
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Hash] Hash representing updated topic
        #
        # @see https://shikimori.one/api/doc/1.0/topics/update Shikimori's API documentation
        # @example Update a topic
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   topic = {
        #     body: "text",
        #     linked_id: "41",
        #     linked_type: "Anime",
        #     title: "zxc",
        #   }
        #   client.v1.update_topic(topic)
        def update_topic(id, topic, headers: nil, **query)
          rest.put base_url.join('topics', id.to_s).url, { topic: topic }, headers: headers, query: query
        end

        # Delete Topic
        #
        # @param id [String, Integer] Topic id
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        #
        # @return [Boolean] True if deletion successful, false otherwise.
        #
        # @see https://shikimori.one/api/doc/1.0/topics/destroy Shikimori's API documentation
        # @example Delete a topic with id equal to 1
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.delete_topic(1)
        def delete_topic(id, headers: nil, **query)
          rest.delete base_url.join('topics', id.to_s).url, headers: headers, query: query
        end

        # Get topics updates
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :page Number of page. Must be between 1 and 100000
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 30
        #
        # @return [Array<Hash>] Array of hashes representing topic updates
        #
        # @see https://shikimori.one/api/doc/1.0/topics/updates Shikimori's API documentation
        # @example Get list of topics updates
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.topics_updates #=> [{ id: 1, ... }, ...]
        def topics_updates(headers: nil, **query)
          rest.get base_url.join('topics', 'updates').url, headers: headers, query: query
        end

        # Get hot topics
        #
        # @param headers [Hash] Request headers
        # @param query [Hash] Query string parameters for request
        # @option query [Integer] :limit Number of titles per page. Must be a lower or equal that 10
        #
        # @return [Array<Hash>] Array of hashes representing topic updates
        #
        # @see https://shikimori.one/api/doc/1.0/topics/hot Shikimori's API documentation
        # @example Get list of hot topics
        #   client = Shikimori::API::Client.new(
        #     app_name: 'Api Test',
        #     aceess_token: '****',
        #     refresh_token: '****'
        #   )
        #   client.v1.hot_topics #=> [{ id: 1, ... }, ...]
        def hot_topics(headers: nil, **query)
          rest.get base_url.join('topics', 'hot').url, headers: headers, query: query
        end
      end
    end
  end
end
