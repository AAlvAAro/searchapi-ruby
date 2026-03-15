# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::TiktokAdsLibraryAdvertiserSearch do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "searches for advertisers by name" do
      expect(client).to receive(:get).with("/search", {
        engine: "tiktok_ads_library_advertiser_search",
        q: "Nike"
      })

      resource.search(q: "Nike")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "tiktok_ads_library_advertiser_search",
        q: "Nike",
        zero_retention: true
      })

      resource.search(q: "Nike", zero_retention: true)
    end
  end
end
