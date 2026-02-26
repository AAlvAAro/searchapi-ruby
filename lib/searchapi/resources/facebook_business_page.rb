# frozen_string_literal: true

module SearchApi
  module Resources
    class FacebookBusinessPage < Resource
      def search(**params)
        get(**params)
      end

      def by_username(username, **params)
        get(username: username, **params)
      end

      def by_page_id(page_id, **params)
        get(page_id: page_id, **params)
      end

      private

      def engine_name
        "facebook_business_page"
      end
    end
  end
end
