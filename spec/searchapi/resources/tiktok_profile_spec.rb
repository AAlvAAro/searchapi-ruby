# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::TiktokProfile do
  let(:client) { instance_double(SearchApi::Client) }
  let(:tiktok) { described_class.new(client) }

  describe "#search" do
    it "searches for a profile by username" do
      expect(client).to receive(:get).with("/search", {
        engine: "tiktok_profile",
        username: "tiktok"
      })

      tiktok.search(username: "tiktok")
    end
  end
end
