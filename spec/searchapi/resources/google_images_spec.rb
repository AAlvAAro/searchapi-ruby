# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleImages do
  let(:client) { instance_double(SearchApi::Client) }
  let(:images) { described_class.new(client) }

  describe "#search" do
    it "searches for images" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_images",
        q: "sunset"
      })

      images.search("sunset")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_images",
        q: "sunset",
        color: "red"
      })

      images.search("sunset", color: "red")
    end
  end
end
