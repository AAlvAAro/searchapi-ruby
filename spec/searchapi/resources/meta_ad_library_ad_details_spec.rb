# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::MetaAdLibraryAdDetails do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "fetches ad details by ad_archive_id" do
      expect(client).to receive(:get).with("/search", {
        engine: "meta_ad_library_ad_details",
        ad_archive_id: "123456789"
      })

      resource.search(ad_archive_id: "123456789")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "meta_ad_library_ad_details",
        ad_archive_id: "123456789",
        is_political: true,
        country: "US",
        page_id: "987654321"
      })

      resource.search(ad_archive_id: "123456789", is_political: true, country: "US", page_id: "987654321")
    end
  end
end
