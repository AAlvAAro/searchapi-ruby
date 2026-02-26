# frozen_string_literal: true

require "faraday"
require "faraday/retry"

module SearchApi
  class Client
    def initialize(config = SearchApi.configuration)
      @config = config
      @connection = build_connection
    end

    def get(path, params = {})
      params[:api_key] = @config.api_key
      response = @connection.get(path.delete_prefix("/"), params)
      Response.new(response)
    rescue Faraday::TooManyRequestsError => e
      raise RateLimitError, e.message
    rescue Faraday::UnauthorizedError => e
      raise AuthenticationError, e.message
    rescue Faraday::TimeoutError, Faraday::ConnectionFailed => e
      raise SearchApi::TimeoutError, e.message
    rescue Faraday::ResourceNotFound => e
      raise NotFoundError, e.message
    rescue Faraday::ServerError => e
      raise SearchApi::ServerError, e.message
    end

    private

    def build_connection
      url = @config.base_url
      url += "/" unless url.end_with?("/")
      Faraday.new(url: url) do |f|
        f.request :retry, max: @config.retries,
                          retry_statuses: [429, 500, 502, 503]
        f.request :json
        f.response :json, content_type: /\bjson$/
        f.response :raise_error
        f.response :logger, @config.logger if @config.logger
        f.options.timeout = @config.timeout
      end
    end
  end
end
