# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::YouTube do
  let(:client) { instance_double(SearchApi::Client) }
  let(:youtube) { described_class.new(client) }

  describe "#search" do
    it "searches YouTube" do
      expect(client).to receive(:get).with("/search", {
        engine: "youtube",
        q: "ruby tutorial"
      })

      youtube.search("ruby tutorial")
    end
  end
end
