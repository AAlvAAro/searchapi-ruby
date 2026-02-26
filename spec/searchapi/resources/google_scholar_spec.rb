# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleScholar do
  let(:client) { instance_double(SearchApi::Client) }
  let(:scholar) { described_class.new(client) }

  describe "#search" do
    it "searches for scholarly articles" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_scholar",
        q: "machine learning"
      })

      scholar.search("machine learning")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_scholar",
        q: "machine learning",
        as_ylo: 2023
      })

      scholar.search("machine learning", as_ylo: 2023)
    end
  end

  describe "#cite" do
    it "fetches citations for an article" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_scholar",
        cites: "123456"
      })

      scholar.cite("123456")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_scholar",
        cites: "123456",
        hl: "en"
      })

      scholar.cite("123456", hl: "en")
    end
  end
end
