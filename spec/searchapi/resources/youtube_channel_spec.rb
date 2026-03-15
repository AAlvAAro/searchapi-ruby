# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::YouTubeChannel do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "fetches channel details" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_channel",
        channel_id: "UCxxxxxx"
      })

      resource.search(channel_id: "UCxxxxxx")
    end

    it "passes optional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube_channel",
        channel_id: "UCxxxxxx",
        gl: "us",
        hl: "en"
      })

      resource.search(channel_id: "UCxxxxxx", gl: "us", hl: "en")
    end
  end
end
