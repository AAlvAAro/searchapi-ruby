# frozen_string_literal: true

module SearchApi
  module Resources
    class DuckDuckGo < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "duckduckgo"
      end
    end
  end
end
