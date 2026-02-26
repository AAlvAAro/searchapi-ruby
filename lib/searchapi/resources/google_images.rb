# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleImages < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_images"
      end
    end
  end
end
