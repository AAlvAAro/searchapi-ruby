# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleAiOverview < Resource
      def search(page_token:, **params)
        get(page_token: page_token, **params)
      end

      private

      def engine_name
        "google_ai_overview"
      end
    end
  end
end
