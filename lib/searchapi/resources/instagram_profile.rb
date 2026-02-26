# frozen_string_literal: true

module SearchApi
  module Resources
    class InstagramProfile < Resource
      def search(username:, **params)
        get(username: username, **params)
      end

      private

      def engine_name
        "instagram_profile"
      end
    end
  end
end
