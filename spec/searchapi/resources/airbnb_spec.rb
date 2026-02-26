# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::Airbnb do
  let(:client) { instance_double(SearchApi::Client) }
  let(:airbnb) { described_class.new(client) }

  describe "#search" do
    it "searches Airbnb with dates" do
      expect(client).to receive(:get).with("/search", {
        engine: "airbnb",
        q: "Tulum",
        check_in: "2026-06-15",
        check_out: "2026-06-18"
      })

      airbnb.search("Tulum", check_in: "2026-06-15", check_out: "2026-06-18")
    end
  end
end
