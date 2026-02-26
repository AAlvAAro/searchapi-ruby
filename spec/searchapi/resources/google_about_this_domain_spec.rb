# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleAboutThisDomain do
  let(:client) { instance_double(SearchApi::Client) }
  let(:about_this_domain) { described_class.new(client) }

  describe "#search" do
    it "searches for domain information" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_about_this_domain",
        domain: "google.com"
      })

      about_this_domain.search(domain: "google.com")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_about_this_domain",
        domain: "google.com",
        hl: "en"
      })

      about_this_domain.search(domain: "google.com", hl: "en")
    end
  end
end
