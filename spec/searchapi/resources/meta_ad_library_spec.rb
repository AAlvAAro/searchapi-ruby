# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::MetaAdLibrary do
  let(:client) { instance_double(SearchApi::Client) }
  let(:meta_ads) { described_class.new(client) }

  describe "#search" do
    it "searches the ad library" do
      expect(client).to receive(:get).with("/search", {
        engine: "meta_ad_library"
      })

      meta_ads.search
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "meta_ad_library",
        q: "shoes",
        active_status: "active"
      })

      meta_ads.search(q: "shoes", active_status: "active")
    end
  end
end
