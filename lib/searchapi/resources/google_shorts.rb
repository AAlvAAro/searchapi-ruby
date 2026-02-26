# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleShorts < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_shorts"
      end
    end
  end
end
