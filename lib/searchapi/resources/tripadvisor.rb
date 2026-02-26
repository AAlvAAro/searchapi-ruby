# frozen_string_literal: true

module SearchApi
  module Resources
    class TripAdvisor < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "tripadvisor"
      end
    end
  end
end
