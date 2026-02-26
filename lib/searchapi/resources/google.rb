# frozen_string_literal: true

module SearchApi
  module Resources
    class Google < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google"
      end
    end
  end
end
