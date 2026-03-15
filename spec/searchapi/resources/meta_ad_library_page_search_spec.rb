# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::MetaAdLibraryPageSearch do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "searches pages by query" do
      expect(client).to receive(:get).with("/search", {
        engine: "meta_ad_library_page_search",
        q: "Nike"
      })

      resource.search(q: "Nike")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "meta_ad_library_page_search",
        q: "Nike",
        country: "US",
        ad_type: "political"
      })

      resource.search(q: "Nike", country: "US", ad_type: "political")
    end
  end
end
