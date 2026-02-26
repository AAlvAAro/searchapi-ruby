# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::AppleAppStore do
  let(:client) { instance_double(SearchApi::Client) }
  let(:app_store) { described_class.new(client) }

  describe "#search" do
    it "searches for apps by term" do
      expect(client).to receive(:get).with("/search", {
        engine: "apple_app_store",
        term: "photo editor"
      })

      app_store.search(term: "photo editor")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "apple_app_store",
        term: "photo editor",
        country: "us",
        num: 50
      })

      app_store.search(term: "photo editor", country: "us", num: 50)
    end
  end
end
