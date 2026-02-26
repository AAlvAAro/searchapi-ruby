# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleHotels do
  let(:client) { instance_double(SearchApi::Client) }
  let(:hotels) { described_class.new(client) }

  describe "#search" do
    it "searches hotels with dates" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_hotels",
        q: "hotels in Guadalajara",
        check_in_date: "2026-06-15",
        check_out_date: "2026-06-18"
      })

      hotels.search("hotels in Guadalajara", check_in: "2026-06-15", check_out: "2026-06-18")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_hotels",
        q: "hotels in CDMX",
        check_in_date: "2026-07-01",
        check_out_date: "2026-07-05",
        adults: 2
      })

      hotels.search("hotels in CDMX", check_in: "2026-07-01", check_out: "2026-07-05", adults: 2)
    end
  end
end
