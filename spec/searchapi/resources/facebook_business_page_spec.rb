# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::FacebookBusinessPage do
  let(:client) { instance_double(SearchApi::Client) }
  let(:facebook) { described_class.new(client) }

  describe "#search" do
    it "searches with params" do
      expect(client).to receive(:get).with("/search", {
        engine: "facebook_business_page"
      })

      facebook.search
    end
  end

  describe "#by_username" do
    it "searches by username" do
      expect(client).to receive(:get).with("/search", {
        engine: "facebook_business_page",
        username: "cocacola"
      })

      facebook.by_username("cocacola")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "facebook_business_page",
        username: "cocacola",
        gl: "us"
      })

      facebook.by_username("cocacola", gl: "us")
    end
  end

  describe "#by_page_id" do
    it "searches by page id" do
      expect(client).to receive(:get).with("/search", {
        engine: "facebook_business_page",
        page_id: "123456789"
      })

      facebook.by_page_id("123456789")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "facebook_business_page",
        page_id: "123456789",
        gl: "us"
      })

      facebook.by_page_id("123456789", gl: "us")
    end
  end
end
