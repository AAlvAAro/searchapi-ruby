# frozen_string_literal: true

module SearchApi
  module Resources
    class AmazonSearch < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "amazon_search"
      end
    end
  end
end
