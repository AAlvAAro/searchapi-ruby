# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::AmazonSearch do
  let(:client) { instance_double(SearchApi::Client) }
  let(:amazon) { described_class.new(client) }

  describe "#search" do
    it "searches for products" do
      expect(client).to receive(:get).with("/search", {
        engine: "amazon_search",
        q: "wireless headphones"
      })

      amazon.search("wireless headphones")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "amazon_search",
        q: "wireless headphones",
        amazon_domain: "amazon.co.uk",
        page: 2
      })

      amazon.search("wireless headphones", amazon_domain: "amazon.co.uk", page: 2)
    end
  end
end
