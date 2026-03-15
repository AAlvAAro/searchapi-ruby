# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::YouTubeTranscripts do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "fetches transcripts for a video" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_transcripts",
        video_id: "dQw4w9WgXcQ"
      })

      resource.search(video_id: "dQw4w9WgXcQ")
    end

    it "passes optional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_transcripts",
        video_id: "dQw4w9WgXcQ",
        lang: "es"
      })

      resource.search(video_id: "dQw4w9WgXcQ", lang: "es")
    end
  end
end
