# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::LinkedinAdLibrary do
  let(:client) { instance_double(SearchApi::Client) }
  let(:linkedin_ads) { described_class.new(client) }

  describe "#search" do
    it "searches the ad library" do
      expect(client).to receive(:get).with("/search", {
        engine: "linkedin_ad_library"
      })

      linkedin_ads.search
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "linkedin_ad_library",
        advertiser: "Google",
        country: "US"
      })

      linkedin_ads.search(advertiser: "Google", country: "US")
    end
  end
end
