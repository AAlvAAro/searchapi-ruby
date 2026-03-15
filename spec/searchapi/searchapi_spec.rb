# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi do
  describe ".configure" do
    it "yields the configuration" do
      described_class.configure do |config|
        config.api_key = "my_key"
        config.timeout = 60
      end

      expect(described_class.configuration.api_key).to eq("my_key")
      expect(described_class.configuration.timeout).to eq(60)
    end
  end

  describe ".reset!" do
    it "resets configuration and client" do
      described_class.configure { |c| c.api_key = "custom_key" }
      described_class.reset!
      described_class.configure { |c| c.api_key = "test_api_key" }

      expect(described_class.configuration.api_key).to eq("test_api_key")
    end

    it "resets cached resource instances" do
      resource1 = described_class.google
      described_class.reset!
      described_class.configure { |c| c.api_key = "test_api_key" }
      resource2 = described_class.google

      expect(resource1).not_to equal(resource2)
    end
  end

  describe "resource accessors" do
    described_class::RESOURCES.each do |name, klass|
      describe ".#{name}" do
        it "returns an instance of #{klass}" do
          expect(described_class.public_send(name)).to be_a(klass)
        end

        it "memoizes the instance" do
          instance1 = described_class.public_send(name)
          instance2 = described_class.public_send(name)

          expect(instance1).to equal(instance2)
        end
      end
    end
  end

  describe ".respond_to_missing?" do
    it "returns true for registered resource names" do
      expect(described_class.respond_to?(:google)).to be true
      expect(described_class.respond_to?(:youtube)).to be true
      expect(described_class.respond_to?(:airbnb)).to be true
    end

    it "returns false for unknown names" do
      expect(described_class.respond_to?(:nonexistent_engine)).to be false
    end
  end

  describe "RESOURCES" do
    it "contains 63 registered engines" do
      expect(described_class::RESOURCES.size).to eq(63)
    end

    it "maps symbols to Resource subclasses" do
      described_class::RESOURCES.each do |name, klass|
        expect(klass).to be < SearchApi::Resource,
          "Expected #{klass} (for :#{name}) to be a subclass of SearchApi::Resource"
      end
    end
  end
end
