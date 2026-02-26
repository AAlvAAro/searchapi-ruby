# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::WalmartSearch do
  let(:client) { instance_double(SearchApi::Client) }
  let(:walmart) { described_class.new(client) }

  describe "#search" do
    it "searches for products" do
      expect(client).to receive(:get).with("/search", {
        engine: "walmart_search",
        q: "organic coffee"
      })

      walmart.search("organic coffee")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "walmart_search",
        q: "organic coffee",
        sort_by: "price_low"
      })

      walmart.search("organic coffee", sort_by: "price_low")
    end
  end
end
