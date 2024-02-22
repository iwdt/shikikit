# frozen_string_literal: true

module Shikimori
  module API
    # Helper to working with URI object
    class URI
      attr_reader :url

      def initialize(uri)
        @url = URI(uri.to_s)
      end

      def join(*path)
        self.class.new ::URI.join(@url, path.join('/'))
      end
    end
  end
end
