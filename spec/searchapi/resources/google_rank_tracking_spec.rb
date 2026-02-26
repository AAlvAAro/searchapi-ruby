# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleRankTracking do
  let(:client) { instance_double(SearchApi::Client) }
  let(:rank_tracking) { described_class.new(client) }

  describe "#search" do
    it "searches with default num of 100" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_rank_tracking",
        q: "best CRM software",
        num: 100
      })

      rank_tracking.search("best CRM software")
    end

    it "allows overriding num" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_rank_tracking",
        q: "best CRM software",
        num: 50
      })

      rank_tracking.search("best CRM software", num: 50)
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_rank_tracking",
        q: "best CRM software",
        num: 100,
        gl: "us"
      })

      rank_tracking.search("best CRM software", gl: "us")
    end
  end
end
