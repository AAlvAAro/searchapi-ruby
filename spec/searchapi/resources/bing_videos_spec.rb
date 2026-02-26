# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::BingVideos do
  let(:client) { instance_double(SearchApi::Client) }
  let(:bing_videos) { described_class.new(client) }

  describe "#search" do
    it "searches for videos" do
      expect(client).to receive(:get).with("/search", {
        engine: "bing_videos",
        q: "cooking tutorial"
      })

      bing_videos.search("cooking tutorial")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "bing_videos",
        q: "cooking tutorial",
        duration: "short"
      })

      bing_videos.search("cooking tutorial", duration: "short")
    end
  end
end
