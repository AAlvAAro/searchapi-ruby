# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleAdsTransparencyCenter < Resource
      def search(**params)
        get(**params)
      end

      def by_advertiser(advertiser_id, **params)
        get(advertiser_id: advertiser_id, **params)
      end

      def by_domain(domain, **params)
        get(domain: domain, **params)
      end

      private

      def engine_name
        "google_ads_transparency_center"
      end
    end
  end
end
