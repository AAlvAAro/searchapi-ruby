# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleLocations < Resource
      def search(q:, **params)
        get(q: q, **params)
      end

      private

      def engine_name
        "google_locations"
      end
    end
  end
end
