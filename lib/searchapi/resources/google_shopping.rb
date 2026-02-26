# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleShopping < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_shopping"
      end
    end
  end
end
