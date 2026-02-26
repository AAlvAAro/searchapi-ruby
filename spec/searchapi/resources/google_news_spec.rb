# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleNews do
  let(:client) { instance_double(SearchApi::Client) }
  let(:news) { described_class.new(client) }

  describe "#search" do
    it "searches Google News" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_news",
        q: "World Cup 2026"
      })

      news.search("World Cup 2026")
    end
  end
end
