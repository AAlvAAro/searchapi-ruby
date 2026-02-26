# frozen_string_literal: true

module SearchApi
  module Resources
    class AppleAppStore < Resource
      def search(term:, **params)
        get(term: term, **params)
      end

      private

      def engine_name
        "apple_app_store"
      end
    end
  end
end
