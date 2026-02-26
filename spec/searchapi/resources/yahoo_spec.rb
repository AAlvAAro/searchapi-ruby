# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::Yahoo do
  let(:client) { instance_double(SearchApi::Client) }
  let(:yahoo) { described_class.new(client) }

  describe "#search" do
    it "searches the web" do
      expect(client).to receive(:get).with("/search", {
        engine: "yahoo",
        q: "weather forecast"
      })

      yahoo.search("weather forecast")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "yahoo",
        q: "weather forecast",
        yahoo_domain: "search.yahoo.co.jp"
      })

      yahoo.search("weather forecast", yahoo_domain: "search.yahoo.co.jp")
    end
  end
end
