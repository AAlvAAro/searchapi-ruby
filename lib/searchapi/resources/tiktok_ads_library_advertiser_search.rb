# frozen_string_literal: true

module SearchApi
  module Resources
    class TiktokAdsLibraryAdvertiserSearch < Resource
      def search(q:, **params)
        get(q: q, **params)
      end

      private

      def engine_name
        "tiktok_ads_library_advertiser_search"
      end
    end
  end
end
