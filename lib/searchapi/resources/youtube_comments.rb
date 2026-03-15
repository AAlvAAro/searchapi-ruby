# frozen_string_literal: true

module SearchApi
  module Resources
    class YouTubeComments < Resource
      def search(video_id:, **params)
        get(video_id: video_id, **params)
      end

      private

      def engine_name
        "youtube_comments"
      end
    end
  end
end
