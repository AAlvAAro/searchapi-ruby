# frozen_string_literal: true

module SearchApi
  module Resources
    class GooglePatents < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_patents"
      end
    end
  end
end
