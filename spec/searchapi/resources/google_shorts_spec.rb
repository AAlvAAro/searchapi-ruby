# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleShorts do
  let(:client) { instance_double(SearchApi::Client) }
  let(:shorts) { described_class.new(client) }

  describe "#search" do
    it "searches for shorts" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_shorts",
        q: "funny cats"
      })

      shorts.search("funny cats")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_shorts",
        q: "funny cats",
        time_period: "last_week"
      })

      shorts.search("funny cats", time_period: "last_week")
    end
  end
end
