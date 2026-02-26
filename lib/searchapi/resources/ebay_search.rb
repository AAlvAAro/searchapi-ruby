# frozen_string_literal: true

module SearchApi
  module Resources
    class EbaySearch < Resource
      def search(query = nil, **params)
        params[:q] = query if query
        get(**params)
      end

      private

      def engine_name
        "ebay_search"
      end
    end
  end
end
