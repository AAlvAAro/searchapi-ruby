# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Configuration do
  subject(:config) { described_class.new }

  it "has default base_url" do
    expect(config.base_url).to eq("https://www.searchapi.io/api/v1")
  end

  it "has default timeout of 30" do
    expect(config.timeout).to eq(30)
  end

  it "has default retries of 2" do
    expect(config.retries).to eq(2)
  end

  it "has nil logger by default" do
    expect(config.logger).to be_nil
  end

  it "reads api_key from ENV" do
    allow(ENV).to receive(:[]).with("SEARCHAPI_API_KEY").and_return("env_key")
    new_config = described_class.new
    expect(new_config.api_key).to eq("env_key")
  end
end

RSpec.describe SearchApi do
  describe ".configure" do
    it "yields configuration" do
      SearchApi.configure do |config|
        config.api_key = "my_key"
        config.timeout = 60
      end

      expect(SearchApi.configuration.api_key).to eq("my_key")
      expect(SearchApi.configuration.timeout).to eq(60)
    end
  end

  describe ".reset!" do
    it "resets configuration and cached instances" do
      SearchApi.configure { |c| c.api_key = "old_key" }
      SearchApi.reset!
      expect(SearchApi.configuration.api_key).not_to eq("old_key")
    end
  end
end
