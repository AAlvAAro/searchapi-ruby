# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleLocations do
  let(:client) { instance_double(SearchApi::Client) }
  let(:resource) { described_class.new(client) }

  describe "#search" do
    it "searches for locations" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_locations",
        q: "new york"
      })

      resource.search(q: "new york")
    end

    it "passes optional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_locations",
        q: "london",
        limit: 5
      })

      resource.search(q: "london", limit: 5)
    end
  end
end
