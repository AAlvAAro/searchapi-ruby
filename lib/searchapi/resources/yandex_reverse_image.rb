# frozen_string_literal: true

module SearchApi
  module Resources
    class YandexReverseImage < Resource
      def search(url:, **params)
        get(url: url, **params)
      end

      private

      def engine_name
        "yandex_reverse_image"
      end
    end
  end
end
