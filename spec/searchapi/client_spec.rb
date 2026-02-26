# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Client do
  subject(:client) do
    SearchApi.configure do |c|
      c.api_key = "test_api_key"
      c.retries = 0
    end
    described_class.new
  end

  let(:base_url) { "https://www.searchapi.io/api/v1" }

  describe "#get" do
    it "makes a GET request with api_key" do
      stub_request(:get, "#{base_url}/search")
        .with(query: { api_key: "test_api_key", engine: "google_maps", q: "coffee" })
        .to_return(
          status: 200,
          body: '{"local_results": []}',
          headers: { "Content-Type" => "application/json" }
        )

      response = client.get("/search", engine: "google_maps", q: "coffee")

      expect(response).to be_a(SearchApi::Response)
      expect(response.success?).to be true
      expect(response.data).to eq("local_results" => [])
    end

    it "raises AuthenticationError on 401" do
      stub_request(:get, "#{base_url}/search")
        .with(query: hash_including(api_key: "test_api_key"))
        .to_return(status: 401, body: '{"error": "unauthorized"}', headers: { "Content-Type" => "application/json" })

      expect { client.get("/search") }.to raise_error(SearchApi::AuthenticationError)
    end

    it "raises RateLimitError on 429" do
      stub_request(:get, "#{base_url}/search")
        .with(query: hash_including(api_key: "test_api_key"))
        .to_return(status: 429, body: '{"error": "rate limited"}', headers: { "Content-Type" => "application/json" })

      expect { client.get("/search") }.to raise_error(SearchApi::RateLimitError)
    end

    it "raises TimeoutError on timeout" do
      stub_request(:get, "#{base_url}/search")
        .with(query: hash_including(api_key: "test_api_key"))
        .to_timeout

      expect { client.get("/search") }.to raise_error(SearchApi::TimeoutError)
    end

    it "raises NotFoundError on 404" do
      stub_request(:get, "#{base_url}/search")
        .with(query: hash_including(api_key: "test_api_key"))
        .to_return(status: 404, body: '{"error": "not found"}', headers: { "Content-Type" => "application/json" })

      expect { client.get("/search") }.to raise_error(SearchApi::NotFoundError)
    end
  end
end
