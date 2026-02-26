# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::TiktokAdsLibrary do
  let(:client) { instance_double(SearchApi::Client) }
  let(:tiktok_ads) { described_class.new(client) }

  describe "#search" do
    it "searches the ads library" do
      expect(client).to receive(:get).with("/search", {
        engine: "tiktok_ads_library"
      })

      tiktok_ads.search
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "tiktok_ads_library",
        q: "fashion",
        country: "US"
      })

      tiktok_ads.search(q: "fashion", country: "US")
    end
  end
end
