# frozen_string_literal: true

module SearchApi
  class Resource
    def initialize(client = SearchApi.client)
      @client = client
    end

    private

    def get(params = {})
      params[:engine] = engine_name
      @client.get("/search", params)
    end

    def engine_name
      raise NotImplementedError
    end
  end
end
