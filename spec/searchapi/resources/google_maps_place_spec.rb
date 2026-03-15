# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleMapsPlace do
  let(:client) { instance_double(SearchApi::Client) }
  let(:place) { described_class.new(client) }

  describe "#search" do
    it "searches by data_id" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps_place",
        data_id: "0x842d123"
      })

      place.search(data_id: "0x842d123")
    end

    it "searches by place_id" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps_place",
        place_id: "ChIJN1t_tDeuEmsRUsoyG83frY4"
      })

      place.search(place_id: "ChIJN1t_tDeuEmsRUsoyG83frY4")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps_place",
        data_id: "0x842d123",
        hl: "es"
      })

      place.search(data_id: "0x842d123", hl: "es")
    end
  end
end
