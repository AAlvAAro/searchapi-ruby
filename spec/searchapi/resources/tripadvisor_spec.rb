# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::TripAdvisor do
  let(:client) { instance_double(SearchApi::Client) }
  let(:tripadvisor) { described_class.new(client) }

  describe "#search" do
    it "searches TripAdvisor" do
      expect(client).to receive(:get).with("/search", {
        engine: "tripadvisor",
        q: "restaurants in Oaxaca"
      })

      tripadvisor.search("restaurants in Oaxaca")
    end
  end
end
