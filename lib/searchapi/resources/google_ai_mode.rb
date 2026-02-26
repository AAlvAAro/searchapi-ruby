# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleAiMode < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_ai_mode"
      end
    end
  end
end
