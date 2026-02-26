# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleVideos do
  let(:client) { instance_double(SearchApi::Client) }
  let(:videos) { described_class.new(client) }

  describe "#search" do
    it "searches for videos" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_videos",
        q: "ruby tutorial"
      })

      videos.search("ruby tutorial")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_videos",
        q: "ruby tutorial",
        duration: "short"
      })

      videos.search("ruby tutorial", duration: "short")
    end
  end
end
