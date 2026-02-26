# frozen_string_literal: true

module SearchApi
  module Resources
    class RedditAdLibrary < Resource
      def search(**params)
        get(**params)
      end

      private

      def engine_name
        "reddit_ad_library"
      end
    end
  end
end
