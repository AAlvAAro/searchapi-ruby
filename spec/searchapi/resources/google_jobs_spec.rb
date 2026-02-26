# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GoogleJobs do
  let(:client) { instance_double(SearchApi::Client) }
  let(:jobs) { described_class.new(client) }

  describe "#search" do
    it "searches for jobs" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_jobs",
        q: "software engineer"
      })

      jobs.search("software engineer")
    end

    it "passes additional params" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_jobs",
        q: "software engineer",
        location: "San Francisco, CA",
        chips: "date_posted:week"
      })

      jobs.search("software engineer", location: "San Francisco, CA", chips: "date_posted:week")
    end
  end
end
