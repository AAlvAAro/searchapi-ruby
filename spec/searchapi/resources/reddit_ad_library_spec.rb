# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::RedditAdLibrary do
  let(:client) { instance_double(SearchApi::Client) }
  let(:reddit_ads) { described_class.new(client) }

  describe "#search" do
    it "searches the ad library" do
      expect(client).to receive(:get).with("/search", {
        engine: "reddit_ad_library"
      })

      reddit_ads.search
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "reddit_ad_library",
        q: "gaming",
        industry: "GAMING"
      })

      reddit_ads.search(q: "gaming", industry: "GAMING")
    end
  end
end
