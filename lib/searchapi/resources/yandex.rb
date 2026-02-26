# frozen_string_literal: true

module SearchApi
  module Resources
    class Yandex < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "yandex"
      end
    end
  end
end
