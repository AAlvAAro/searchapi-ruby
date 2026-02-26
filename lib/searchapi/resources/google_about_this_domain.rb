# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleAboutThisDomain < Resource
      def search(domain:, **params)
        get(domain: domain, **params)
      end

      private

      def engine_name
        "google_about_this_domain"
      end
    end
  end
end
