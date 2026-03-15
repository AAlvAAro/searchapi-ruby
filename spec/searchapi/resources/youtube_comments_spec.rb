# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::YouTubeComments do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "fetches comments for a video" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_comments",
        video_id: "dQw4w9WgXcQ"
      })

      resource.search(video_id: "dQw4w9WgXcQ")
    end

    it "supports pagination" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_comments",
        video_id: "dQw4w9WgXcQ",
        next_page_token: "abc123"
      })

      resource.search(video_id: "dQw4w9WgXcQ", next_page_token: "abc123")
    end
  end
end
