# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleForums < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_forums"
      end
    end
  end
end
