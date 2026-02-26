# frozen_string_literal: true

module SearchApi
  module Resources
    class LinkedinAdLibrary < Resource
      def search(**params)
        get(**params)
      end

      private

      def engine_name
        "linkedin_ad_library"
      end
    end
  end
end
