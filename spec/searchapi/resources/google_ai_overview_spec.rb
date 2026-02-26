# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleAiOverview do
  let(:client) { instance_double(SearchApi::Client) }
  let(:ai_overview) { described_class.new(client) }

  describe "#search" do
    it "searches by page token" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_ai_overview",
        page_token: "abc123token"
      })

      ai_overview.search(page_token: "abc123token")
    end
  end
end
