# frozen_string_literal: true

module SearchApi
  module Resources
    class MetaAdLibraryAdDetails < Resource
      def search(ad_archive_id:, **params)
        get(ad_archive_id: ad_archive_id, **params)
      end

      private

      def engine_name
        "meta_ad_library_ad_details"
      end
    end
  end
end
