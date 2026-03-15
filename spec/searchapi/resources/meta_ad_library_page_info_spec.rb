# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::MetaAdLibraryPageInfo do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "fetches page info by page_id" do
      expect(client).to receive(:get).with("/search", {
        engine: "meta_ad_library_page_info",
        page_id: "123456789"
      })

      resource.search(page_id: "123456789")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "meta_ad_library_page_info",
        page_id: "123456789",
        zero_retention: true
      })

      resource.search(page_id: "123456789", zero_retention: true)
    end
  end
end
