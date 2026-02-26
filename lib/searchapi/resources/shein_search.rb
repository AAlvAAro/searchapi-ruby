# frozen_string_literal: true

module SearchApi
  module Resources
    class SheinSearch < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "shein_search"
      end
    end
  end
end
