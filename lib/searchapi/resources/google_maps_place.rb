# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleMapsPlace < Resource
      def search(data_id: nil, place_id: nil, **params)
        params[:data_id] = data_id if data_id
        params[:place_id] = place_id if place_id
        get(**params)
      end

      private

      def engine_name
        "google_maps_place"
      end
    end
  end
end
