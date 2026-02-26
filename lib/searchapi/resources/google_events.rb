# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleEvents < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_events"
      end
    end
  end
end
