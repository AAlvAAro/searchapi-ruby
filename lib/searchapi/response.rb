# frozen_string_literal: true

module SearchApi
  class Response
    attr_reader :data, :status, :headers

    def initialize(faraday_response)
      @data    = faraday_response.body
      @status  = faraday_response.status
      @headers = faraday_response.headers
    end

    def success?
      status == 200
    end

    def results
      data.is_a?(Hash) ? data : {}
    end

    def credits_remaining
      headers["x-remaining-credits"]&.to_i
    end
  end
end
