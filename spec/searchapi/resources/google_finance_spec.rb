# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleFinance do
  let(:client) { instance_double(SearchApi::Client) }
  let(:finance) { described_class.new(client) }

  describe "#search" do
    it "searches for financial data" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_finance",
        q: "NVDA:NASDAQ"
      })

      finance.search("NVDA:NASDAQ")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_finance",
        q: "NVDA:NASDAQ",
        window: "1Y"
      })

      finance.search("NVDA:NASDAQ", window: "1Y")
    end
  end
end
