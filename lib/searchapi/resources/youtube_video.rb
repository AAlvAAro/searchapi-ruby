# frozen_string_literal: true

module SearchApi
  module Resources
    class YouTubeVideo < Resource
      def search(video_id:, **params)
        get(video_id: video_id, **params)
      end

      private

      def engine_name
        "youtube_video"
      end
    end
  end
end
