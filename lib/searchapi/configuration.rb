# frozen_string_literal: true

module SearchApi
  class Configuration
    attr_accessor :api_key, :base_url, :timeout, :retries, :logger

    def initialize
      @api_key  = ENV["SEARCHAPI_API_KEY"]
      @base_url = "https://www.searchapi.io/api/v1"
      @timeout  = 30
      @retries  = 2
      @logger   = nil
    end
  end
end
