# frozen_string_literal: true

module SearchApi
  module Resources
    class YouTube < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "youtube"
      end
    end
  end
end
