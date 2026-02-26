# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleFlights do
  let(:client) { instance_double(SearchApi::Client) }
  let(:flights) { described_class.new(client) }

  describe "#search" do
    it "searches one-way flights" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_flights",
        departure_id: "MEX",
        arrival_id: "GDL",
        outbound_date: "2026-06-15",
        return_date: nil
      })

      flights.search(from: "MEX", to: "GDL", outbound_date: "2026-06-15")
    end

    it "searches round-trip flights" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_flights",
        departure_id: "MEX",
        arrival_id: "GDL",
        outbound_date: "2026-06-15",
        return_date: "2026-06-18"
      })

      flights.search(from: "MEX", to: "GDL", outbound_date: "2026-06-15", return_date: "2026-06-18")
    end
  end
end
