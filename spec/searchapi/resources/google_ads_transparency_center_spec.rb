# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleAdsTransparencyCenter do
  let(:client) { instance_double(SearchApi::Client) }
  let(:ads_transparency) { described_class.new(client) }

  describe "#search" do
    it "searches the ads transparency center" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_ads_transparency_center"
      })

      ads_transparency.search
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_ads_transparency_center",
        region: "US",
        format: "VIDEO"
      })

      ads_transparency.search(region: "US", format: "VIDEO")
    end
  end

  describe "#by_advertiser" do
    it "searches ads by advertiser ID" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_ads_transparency_center",
        advertiser_id: "AR01234567890123456"
      })

      ads_transparency.by_advertiser("AR01234567890123456")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_ads_transparency_center",
        advertiser_id: "AR01234567890123456",
        region: "US"
      })

      ads_transparency.by_advertiser("AR01234567890123456", region: "US")
    end
  end

  describe "#by_domain" do
    it "searches ads by domain" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_ads_transparency_center",
        domain: "example.com"
      })

      ads_transparency.by_domain("example.com")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_ads_transparency_center",
        domain: "example.com",
        region: "US"
      })

      ads_transparency.by_domain("example.com", region: "US")
    end
  end
end
