# frozen_string_literal: true

module SearchApi
  module Resources
    class Bing < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "bing"
      end
    end
  end
end
