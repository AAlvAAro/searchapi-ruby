# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::Google do
  let(:client) { instance_double(SearchApi::Client) }
  let(:google) { described_class.new(client) }

  describe "#search" do
    it "searches Google" do
      expect(client).to receive(:get).with("/search", {
        engine: "google",
        q: "ruby programming"
      })

      google.search("ruby programming")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google",
        q: "ruby programming",
        gl: "us",
        num: 10
      })

      google.search("ruby programming", gl: "us", num: 10)
    end
  end
end
