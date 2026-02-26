# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleTrends do
  let(:client) { instance_double(SearchApi::Client) }
  let(:trends) { described_class.new(client) }

  describe "#search" do
    it "searches trends with a data_type" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "TIMESERIES"
      })

      trends.search("artificial intelligence", data_type: "TIMESERIES")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "TIMESERIES",
        date: "today 12-m"
      })

      trends.search("artificial intelligence", data_type: "TIMESERIES", date: "today 12-m")
    end
  end

  describe "#interest_over_time" do
    it "fetches interest over time" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "TIMESERIES"
      })

      trends.interest_over_time("artificial intelligence")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "TIMESERIES",
        date: "today 12-m"
      })

      trends.interest_over_time("artificial intelligence", date: "today 12-m")
    end
  end

  describe "#interest_by_region" do
    it "fetches interest by region" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "GEO_MAP"
      })

      trends.interest_by_region("artificial intelligence")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "GEO_MAP",
        geo: "US"
      })

      trends.interest_by_region("artificial intelligence", geo: "US")
    end
  end

  describe "#related_queries" do
    it "fetches related queries" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "RELATED_QUERIES"
      })

      trends.related_queries("artificial intelligence")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "RELATED_QUERIES",
        hl: "en"
      })

      trends.related_queries("artificial intelligence", hl: "en")
    end
  end

  describe "#related_topics" do
    it "fetches related topics" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "RELATED_TOPICS"
      })

      trends.related_topics("artificial intelligence")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_trends",
        q: "artificial intelligence",
        data_type: "RELATED_TOPICS",
        hl: "en"
      })

      trends.related_topics("artificial intelligence", hl: "en")
    end
  end
end
