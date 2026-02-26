# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::YandexReverseImage do
  let(:client) { instance_double(SearchApi::Client) }
  let(:yandex_reverse_image) { described_class.new(client) }

  describe "#search" do
    it "searches by image url" do
      expect(client).to receive(:get).with("/search", {
        engine: "yandex_reverse_image",
        url: "https://example.com/photo.jpg"
      })

      yandex_reverse_image.search(url: "https://example.com/photo.jpg")
    end
  end
end
