# frozen_string_literal: true

module Shikimori
  module API
    class RequestError < StandardError; end

    class NotFoundError < RequestError; end
    class ForbiddenError < RequestError; end

    # Error, when request is bad
    class BadRequestError < RequestError
      attr_reader :errors

      def initialize(errors)
        @errors = errors.is_a?(Hash) ? errors['errors'] : errors

        super("Bad request. Errors:\n\t#{@errors.join("\n\t")}")
      end
    end
  end
end
