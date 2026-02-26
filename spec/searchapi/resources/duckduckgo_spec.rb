# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::DuckDuckGo do
  let(:client) { instance_double(SearchApi::Client) }
  let(:duckduckgo) { described_class.new(client) }

  describe "#search" do
    it "searches the web" do
      expect(client).to receive(:get).with("/search", {
        engine: "duckduckgo",
        q: "privacy tools"
      })

      duckduckgo.search("privacy tools")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "duckduckgo",
        q: "privacy tools",
        safe: "moderate"
      })

      duckduckgo.search("privacy tools", safe: "moderate")
    end
  end
end
