# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleNews < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_news"
      end
    end
  end
end
