# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::Bing do
  let(:client) { instance_double(SearchApi::Client) }
  let(:bing) { described_class.new(client) }

  describe "#search" do
    it "searches the web" do
      expect(client).to receive(:get).with("/search", {
        engine: "bing",
        q: "artificial intelligence"
      })

      bing.search("artificial intelligence")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "bing",
        q: "artificial intelligence",
        num: 30,
        market_code: "en-US"
      })

      bing.search("artificial intelligence", num: 30, market_code: "en-US")
    end
  end
end
