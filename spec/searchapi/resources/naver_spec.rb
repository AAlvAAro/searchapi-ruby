# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::Naver do
  let(:client) { instance_double(SearchApi::Client) }
  let(:naver) { described_class.new(client) }

  describe "#search" do
    it "searches the web" do
      expect(client).to receive(:get).with("/search", {
        engine: "naver",
        q: "한국 뉴스"
      })

      naver.search("한국 뉴스")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "naver",
        q: "한국 뉴스",
        page: 3
      })

      naver.search("한국 뉴스", page: 3)
    end
  end
end
