# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::YouTubeChannelVideos do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "fetches videos for a channel" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_channel_videos",
        channel_id: "UCxxxxxx"
      })

      resource.search(channel_id: "UCxxxxxx")
    end

    it "supports pagination" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_channel_videos",
        channel_id: "UCxxxxxx",
        next_page_token: "abc123"
      })

      resource.search(channel_id: "UCxxxxxx", next_page_token: "abc123")
    end
  end
end
