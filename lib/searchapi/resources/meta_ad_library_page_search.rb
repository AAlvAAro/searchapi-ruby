# frozen_string_literal: true

module SearchApi
  module Resources
    class MetaAdLibraryPageSearch < Resource
      def search(q:, **params)
        get(q: q, **params)
      end

      private

      def engine_name
        "meta_ad_library_page_search"
      end
    end
  end
end
