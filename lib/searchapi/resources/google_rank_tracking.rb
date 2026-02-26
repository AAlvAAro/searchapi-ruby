# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleRankTracking < Resource
      def search(query, num: 100, **params)
        get(q: query, num: num, **params)
      end

      private

      def engine_name
        "google_rank_tracking"
      end
    end
  end
end
