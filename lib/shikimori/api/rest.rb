# frozen_string_literal: true

module Shikimori
  module API
    # Helpers to make requests
    class REST
      def initialize(app_name: nil, access_token: nil, refresh_token: nil, **options)
        @app_name = app_name
        @access_token = access_token
        @refresh_token = refresh_token
        @proxy_host = options.fetch(:proxy_host, nil)
        @proxy_port = options.fetch(:proxy_port, nil)
        @proxy_user = options.fetch(:proxy_user, nil)
        @proxy_password = options.fetch(:proxy_password, nil)
      end

      def get(uri, **options)
        _response, json = request(:get, uri, **options)
        json
      end

      def post(uri, data, **options)
        _response, json = request(:post, uri, data, **options)
        json
      end

      def put(uri, data, **options)
        _response, json = request(:put, uri, data, **options)
        json
      end

      def delete(uri, **options)
        response, _json = request(:delete, uri, **options)
        [Net::HTTPNoContent, Net::HTTPSuccess].any? { response.is_a?(_1) }
      end

      private

      def request(method, uri, body = nil, **options)
        request = build_request(method, uri, **options)
        response = start_request(uri, request, body, **options)

        [response, parse_response(response)]
      end

      def build_request(method, uri, **options)
        headers = headers_from(options)
        query = query_params_from(uri, options)
        uri.query = query if !query.nil? && !query.empty?

        case method
        when :get
          Net::HTTP::Get.new(uri, headers)
        when :post
          Net::HTTP::Post.new(uri, headers)
        when :put
          Net::HTTP::Put.new(uri, headers)
        when :delete
          Net::HTTP::Delete.new(uri, headers)
        end
      end

      def start_request(uri, request, body = nil, **options)
        unless body.nil?
          if options.fetch(:as_form, false)
            request.set_form(body, 'multipart/form-data')
          else
            request.body = body.to_json
          end
        end

        Net::HTTP.start(
          uri.hostname.to_s, uri.port,
          @proxy_host, @proxy_port, @proxy_user, @proxy_password,
          use_ssl: uri.scheme == 'https'
        ) do |http|
          http.request(request)
        end
      end

      def parse_response(response)
        case response
        when Net::HTTPNoContent
          {}
        when Net::HTTPSuccess, Net::HTTPCreated
          json_parse_response_body(response.body)
        when Net::HTTPForbidden
          raise ForbiddenError
        when Net::HTTPNotFound
          raise NotFoundError
        when Net::HTTPUnprocessableEntity, Net::HTTPBadRequest
          raise BadRequestError, json_parse_response_body(response.body)
        end
      end

      def json_parse_response_body(body)
        JSON.parse(body&.empty? ? '{}' : body)
      rescue JSON::ParserError
        {}
      end

      def headers_from(options)
        (options[:headers] || {}).merge(
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{@access_token}",
          'User-Agent' => @app_name
        ).compact
      end

      def query_params_from(uri, options)
        queries = ::URI.decode_www_form uri.query || ''
        (options[:query] || {}).each do |key, value|
          queries << [key, value]
        end
        ::URI.encode_www_form(queries)
      end
    end
  end
end
