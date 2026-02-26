# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleHotels < Resource
      def search(query, check_in:, check_out:, **params)
        get(q: query, check_in_date: check_in, check_out_date: check_out, **params)
      end

      private

      def engine_name
        "google_hotels"
      end
    end
  end
end
