# frozen_string_literal: true

module SearchApi
  module Resources
    class Baidu < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "baidu"
      end
    end
  end
end
