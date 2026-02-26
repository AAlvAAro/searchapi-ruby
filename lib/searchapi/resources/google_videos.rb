# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleVideos < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_videos"
      end
    end
  end
end
