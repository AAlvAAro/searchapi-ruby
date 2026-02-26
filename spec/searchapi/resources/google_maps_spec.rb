# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleMaps do
  let(:client) { instance_double(SearchApi::Client) }
  let(:maps) { described_class.new(client) }

  describe "#search" do
    it "searches for places" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps",
        q: "coffee in Morelia"
      })

      maps.search("coffee in Morelia")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps",
        q: "tacos",
        ll: "@19.4,-99.1,15z"
      })

      maps.search("tacos", ll: "@19.4,-99.1,15z")
    end
  end

  describe "#place" do
    it "gets place details by data_id" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps",
        data_id: "0x842d123"
      })

      maps.place(data_id: "0x842d123")
    end
  end

  describe "#directions" do
    it "gets directions between two points" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps_directions",
        start_addr: "Mexico City",
        end_addr: "Guadalajara"
      })

      maps.directions(start: "Mexico City", destination: "Guadalajara")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps_directions",
        start_addr: "CDMX",
        end_addr: "Oaxaca",
        travel_mode: "1"
      })

      maps.directions(start: "CDMX", destination: "Oaxaca", travel_mode: "1")
    end
  end
end
