# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleLens do
  let(:client) { instance_double(SearchApi::Client) }
  let(:lens) { described_class.new(client) }

  describe "#search" do
    it "searches by image url" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_lens",
        url: "https://example.com/image.jpg"
      })

      lens.search(url: "https://example.com/image.jpg")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_lens",
        url: "https://example.com/image.jpg",
        search_type: "products"
      })

      lens.search(url: "https://example.com/image.jpg", search_type: "products")
    end
  end
end
