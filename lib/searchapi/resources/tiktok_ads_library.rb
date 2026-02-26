# frozen_string_literal: true

module SearchApi
  module Resources
    class TiktokAdsLibrary < Resource
      def search(**params)
        get(**params)
      end

      private

      def engine_name
        "tiktok_ads_library"
      end
    end
  end
end
