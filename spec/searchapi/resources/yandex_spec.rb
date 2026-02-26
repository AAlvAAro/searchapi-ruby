# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::Yandex do
  let(:client) { instance_double(SearchApi::Client) }
  let(:yandex) { described_class.new(client) }

  describe "#search" do
    it "searches the web" do
      expect(client).to receive(:get).with("/search", {
        engine: "yandex",
        q: "programming"
      })

      yandex.search("programming")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "yandex",
        q: "programming",
        lang: "en",
        page: 2
      })

      yandex.search("programming", lang: "en", page: 2)
    end
  end
end
