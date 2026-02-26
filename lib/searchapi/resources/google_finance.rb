# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleFinance < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_finance"
      end
    end
  end
end
