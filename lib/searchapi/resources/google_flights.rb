# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleFlights < Resource
      def search(from:, to:, outbound_date:, return_date: nil, **params)
        get(
          departure_id: from,
          arrival_id: to,
          outbound_date: outbound_date,
          return_date: return_date,
          **params
        )
      end

      private

      def engine_name
        "google_flights"
      end
    end
  end
end
