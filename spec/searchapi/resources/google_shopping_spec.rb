# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleShopping do
  let(:client) { instance_double(SearchApi::Client) }
  let(:shopping) { described_class.new(client) }

  describe "#search" do
    it "searches for products" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_shopping",
        q: "laptop"
      })

      shopping.search("laptop")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_shopping",
        q: "laptop",
        sort_by: "price_low_to_high"
      })

      shopping.search("laptop", sort_by: "price_low_to_high")
    end
  end
end
