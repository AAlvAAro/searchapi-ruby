# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::AirbnbPropertyReviews do
  let(:client) { instance_double(SearchApi::Client) }
  let(:reviews) { described_class.new(client) }

  describe "#search" do
    it "fetches reviews for a property" do
      expect(client).to receive(:get).with("/search", {
        engine: "airbnb_property_reviews",
        property_id: "12345"
      })

      reviews.search(property_id: "12345")
    end

    it "passes optional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "airbnb_property_reviews",
        property_id: "12345",
        sort_by: "most_recent",
        page: 2
      })

      reviews.search(property_id: "12345", sort_by: "most_recent", page: 2)
    end
  end
end
