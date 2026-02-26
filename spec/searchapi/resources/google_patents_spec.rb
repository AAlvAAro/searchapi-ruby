# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GooglePatents do
  let(:client) { instance_double(SearchApi::Client) }
  let(:patents) { described_class.new(client) }

  describe "#search" do
    it "searches for patents" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_patents",
        q: "solar panel"
      })

      patents.search("solar panel")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_patents",
        q: "solar panel",
        patent_status: "GRANT",
        num: 20
      })

      patents.search("solar panel", patent_status: "GRANT", num: 20)
    end
  end
end
