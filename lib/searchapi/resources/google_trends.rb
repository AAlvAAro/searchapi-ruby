# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleTrends < Resource
      def search(query, data_type:, **params)
        get(q: query, data_type: data_type, **params)
      end

      def interest_over_time(query, **params)
        search(query, data_type: "TIMESERIES", **params)
      end

      def interest_by_region(query, **params)
        search(query, data_type: "GEO_MAP", **params)
      end

      def related_queries(query, **params)
        search(query, data_type: "RELATED_QUERIES", **params)
      end

      def related_topics(query, **params)
        search(query, data_type: "RELATED_TOPICS", **params)
      end

      private

      def engine_name
        "google_trends"
      end
    end
  end
end
