# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::EbaySearch do
  let(:client) { instance_double(SearchApi::Client) }
  let(:ebay) { described_class.new(client) }

  describe "#search" do
    it "searches with a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "ebay_search",
        q: "vintage watch"
      })

      ebay.search("vintage watch")
    end

    it "searches without a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "ebay_search",
        category_id: "123"
      })

      ebay.search(category_id: "123")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "ebay_search",
        q: "vintage watch",
        condition: "used",
        sort_by: "price_low"
      })

      ebay.search("vintage watch", condition: "used", sort_by: "price_low")
    end
  end
end
