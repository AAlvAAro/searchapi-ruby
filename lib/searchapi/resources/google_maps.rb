# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleMaps < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      def place(data_id:, **params)
        get(data_id: data_id, **params)
      end

      def directions(start:, destination:, **params)
        @client.get("/search", {
          engine: "google_maps_directions",
          start_addr: start,
          end_addr: destination,
          **params
        })
      end

      private

      def engine_name
        "google_maps"
      end
    end
  end
end
