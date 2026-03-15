# frozen_string_literal: true

module SearchApi
  module Resources
    class MetaAdLibraryPageInfo < Resource
      def search(page_id:, **params)
        get(page_id: page_id, **params)
      end

      private

      def engine_name
        "meta_ad_library_page_info"
      end
    end
  end
end
