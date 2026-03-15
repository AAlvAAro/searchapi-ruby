# frozen_string_literal: true

module SearchApi
  module Resources
    class AirbnbPropertyReviews < Resource
      def search(property_id:, **params)
        get(property_id: property_id, **params)
      end

      private

      def engine_name
        "airbnb_property_reviews"
      end
    end
  end
end
