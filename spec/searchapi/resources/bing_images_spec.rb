# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::BingImages do
  let(:client) { instance_double(SearchApi::Client) }
  let(:bing_images) { described_class.new(client) }

  describe "#search" do
    it "searches for images" do
      expect(client).to receive(:get).with("/search", {
        engine: "bing_images",
        q: "mountain landscape"
      })

      bing_images.search("mountain landscape")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "bing_images",
        q: "mountain landscape",
        size: "large"
      })

      bing_images.search("mountain landscape", size: "large")
    end
  end
end
