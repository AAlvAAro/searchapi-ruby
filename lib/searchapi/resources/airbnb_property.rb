# frozen_string_literal: true

module SearchApi
  module Resources
    class AirbnbProperty < Resource
      def search(property_id: nil, booking_token: nil, **params)
        params[:property_id] = property_id if property_id
        params[:booking_token] = booking_token if booking_token
        get(**params)
      end

      private

      def engine_name
        "airbnb_property"
      end
    end
  end
end
