# frozen_string_literal: true

module SearchApi
  module Resources
    class MetaAdLibrary < Resource
      def search(**params)
        get(**params)
      end

      private

      def engine_name
        "meta_ad_library"
      end
    end
  end
end
