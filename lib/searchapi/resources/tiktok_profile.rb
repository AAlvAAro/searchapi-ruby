# frozen_string_literal: true

module SearchApi
  module Resources
    class TiktokProfile < Resource
      def search(username:, **params)
        get(username: username, **params)
      end

      private

      def engine_name
        "tiktok_profile"
      end
    end
  end
end
