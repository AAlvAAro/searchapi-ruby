# frozen_string_literal: true

module SearchApi
  module Resources
    class BingImages < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "bing_images"
      end
    end
  end
end
