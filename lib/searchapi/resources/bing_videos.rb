# frozen_string_literal: true

module SearchApi
  module Resources
    class BingVideos < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "bing_videos"
      end
    end
  end
end
