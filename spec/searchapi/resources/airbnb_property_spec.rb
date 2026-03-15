# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::AirbnbProperty do
  let(:client) { instance_double(SearchApi::Client) }
  let(:property) { described_class.new(client) }

  describe "#search" do
    it "fetches property by property_id" do
      expect(client).to receive(:get).with("/search", {
        engine: "airbnb_property",
        property_id: "12345"
      })

      property.search(property_id: "12345")
    end

    it "fetches property by booking_token" do
      expect(client).to receive(:get).with("/search", {
        engine: "airbnb_property",
        booking_token: "token_abc"
      })

      property.search(booking_token: "token_abc")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "airbnb_property",
        property_id: "12345",
        check_in_date: "2025-06-01",
        check_out_date: "2025-06-07",
        adults: 2
      })

      property.search(property_id: "12345", check_in_date: "2025-06-01", check_out_date: "2025-06-07", adults: 2)
    end
  end
end
