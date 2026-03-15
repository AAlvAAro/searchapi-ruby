# frozen_string_literal: true

module SearchApi
  module Resources
    class YouTubeChannel < Resource
      def search(channel_id:, **params)
        get(channel_id: channel_id, **params)
      end

      private

      def engine_name
        "youtube_channel"
      end
    end
  end
end
