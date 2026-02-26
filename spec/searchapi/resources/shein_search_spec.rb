# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::SheinSearch do
  let(:client) { instance_double(SearchApi::Client) }
  let(:shein) { described_class.new(client) }

  describe "#search" do
    it "searches for products" do
      expect(client).to receive(:get).with("/search", {
        engine: "shein_search",
        q: "summer dress"
      })

      shein.search("summer dress")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "shein_search",
        q: "summer dress",
        sort_by: "price_asc",
        currency: "USD"
      })

      shein.search("summer dress", sort_by: "price_asc", currency: "USD")
    end
  end
end
