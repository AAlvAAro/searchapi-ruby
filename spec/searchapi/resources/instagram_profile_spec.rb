# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::InstagramProfile do
  let(:client) { instance_double(SearchApi::Client) }
  let(:instagram) { described_class.new(client) }

  describe "#search" do
    it "searches for a profile by username" do
      expect(client).to receive(:get).with("/search", {
        engine: "instagram_profile",
        username: "instagram"
      })

      instagram.search(username: "instagram")
    end
  end
end
