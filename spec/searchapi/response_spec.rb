# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Response do
  let(:faraday_response) do
    instance_double(
      Faraday::Response,
      body: { "local_results" => [] },
      status: 200,
      headers: { "x-remaining-credits" => "95" }
    )
  end

  subject(:response) { described_class.new(faraday_response) }

  describe "#success?" do
    it "returns true for 200 status" do
      expect(response.success?).to be true
    end

    it "returns false for non-200 status" do
      allow(faraday_response).to receive(:status).and_return(422)
      expect(response.success?).to be false
    end
  end

  describe "#results" do
    it "returns data when it is a hash" do
      expect(response.results).to eq("local_results" => [])
    end

    it "returns empty hash when data is not a hash" do
      allow(faraday_response).to receive(:body).and_return("not a hash")
      resp = described_class.new(faraday_response)
      expect(resp.results).to eq({})
    end
  end

  describe "#credits_remaining" do
    it "returns credits as integer" do
      expect(response.credits_remaining).to eq(95)
    end

    it "returns nil when header is missing" do
      allow(faraday_response).to receive(:headers).and_return({})
      resp = described_class.new(faraday_response)
      expect(resp.credits_remaining).to be_nil
    end
  end
end
