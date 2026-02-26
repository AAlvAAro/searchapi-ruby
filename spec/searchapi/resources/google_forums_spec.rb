# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleForums do
  let(:client) { instance_double(SearchApi::Client) }
  let(:forums) { described_class.new(client) }

  describe "#search" do
    it "searches for forum posts" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_forums",
        q: "best ruby gems"
      })

      forums.search("best ruby gems")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_forums",
        q: "best ruby gems",
        time_period: "last_month"
      })

      forums.search("best ruby gems", time_period: "last_month")
    end
  end
end
