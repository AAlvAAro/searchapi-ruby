# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleMapsReviews do
  let(:client) { instance_double(SearchApi::Client) }
  let(:reviews) { described_class.new(client) }

  describe "#search" do
    it "fetches reviews by data_id" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps_reviews",
        data_id: "0x842d123"
      })

      reviews.search(data_id: "0x842d123")
    end

    it "fetches reviews by place_id" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps_reviews",
        place_id: "ChIJN1t_tDeuEmsRUsoyG83frY4"
      })

      reviews.search(place_id: "ChIJN1t_tDeuEmsRUsoyG83frY4")
    end

    it "passes optional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps_reviews",
        data_id: "0x842d123",
        sort_by: "newest",
        num: 20
      })

      reviews.search(data_id: "0x842d123", sort_by: "newest", num: 20)
    end

    it "supports pagination" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_maps_reviews",
        data_id: "0x842d123",
        next_page_token: "abc123"
      })

      reviews.search(data_id: "0x842d123", next_page_token: "abc123")
    end
  end
end
