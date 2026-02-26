# frozen_string_literal: true

module SearchApi
  module Resources
    class Yahoo < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "yahoo"
      end
    end
  end
end
