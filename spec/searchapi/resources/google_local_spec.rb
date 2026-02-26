# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleLocal do
  let(:client) { instance_double(SearchApi::Client) }
  let(:local) { described_class.new(client) }

  describe "#search" do
    it "searches for local results" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_local",
        q: "restaurants"
      })

      local.search("restaurants")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_local",
        q: "restaurants",
        location: "New York"
      })

      local.search("restaurants", location: "New York")
    end
  end
end
