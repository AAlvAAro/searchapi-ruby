# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::Baidu do
  let(:client) { instance_double(SearchApi::Client) }
  let(:baidu) { described_class.new(client) }

  describe "#search" do
    it "searches the web" do
      expect(client).to receive(:get).with("/search", {
        engine: "baidu",
        q: "人工智能"
      })

      baidu.search("人工智能")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "baidu",
        q: "人工智能",
        num: 20
      })

      baidu.search("人工智能", num: 20)
    end
  end
end
