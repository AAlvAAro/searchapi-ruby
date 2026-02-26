# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleLens < Resource
      def search(url:, **params)
        get(url: url, **params)
      end

      private

      def engine_name
        "google_lens"
      end
    end
  end
end
