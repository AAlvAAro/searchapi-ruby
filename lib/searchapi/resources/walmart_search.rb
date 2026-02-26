# frozen_string_literal: true

module SearchApi
  module Resources
    class WalmartSearch < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "walmart_search"
      end
    end
  end
end
