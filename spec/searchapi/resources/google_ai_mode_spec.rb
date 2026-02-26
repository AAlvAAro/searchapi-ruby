# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleAiMode do
  let(:client) { instance_double(SearchApi::Client) }
  let(:ai_mode) { described_class.new(client) }

  describe "#search" do
    it "searches using AI mode" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_ai_mode",
        q: "explain quantum computing"
      })

      ai_mode.search("explain quantum computing")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_ai_mode",
        q: "explain quantum computing",
        hl: "en",
        gl: "us"
      })

      ai_mode.search("explain quantum computing", hl: "en", gl: "us")
    end
  end
end
