# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleEvents do
  let(:client) { instance_double(SearchApi::Client) }
  let(:events) { described_class.new(client) }

  describe "#search" do
    it "searches for events" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_events",
        q: "concerts in Austin"
      })

      events.search("concerts in Austin")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_events",
        q: "concerts in Austin",
        chips: "date:today"
      })

      events.search("concerts in Austin", chips: "date:today")
    end
  end
end
