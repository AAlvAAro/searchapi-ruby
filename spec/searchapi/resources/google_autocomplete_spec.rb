# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleAutocomplete do
  let(:client) { instance_double(SearchApi::Client) }
  let(:autocomplete) { described_class.new(client) }

  describe "#search" do
    it "fetches autocomplete suggestions" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_autocomplete",
        q: "how to"
      })

      autocomplete.search("how to")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_autocomplete",
        q: "how to",
        client: "chrome"
      })

      autocomplete.search("how to", client: "chrome")
    end
  end
end
