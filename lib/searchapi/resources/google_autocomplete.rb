# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleAutocomplete < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_autocomplete"
      end
    end
  end
end
