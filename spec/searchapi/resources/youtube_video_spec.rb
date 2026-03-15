# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::YouTubeVideo do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "fetches video details" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_video",
        video_id: "dQw4w9WgXcQ"
      })

      resource.search(video_id: "dQw4w9WgXcQ")
    end

    it "passes optional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_video",
        video_id: "dQw4w9WgXcQ",
        gl: "us",
        hl: "en"
      })

      resource.search(video_id: "dQw4w9WgXcQ", gl: "us", hl: "en")
    end
  end
end
