# frozen_string_literal: true

require "spec_helper"

RSpec.describe SearchApi::Resources::GooglePlayStore do
  let(:client) { instance_double(SearchApi::Client) }
  let(:play_store) { described_class.new(client) }

  describe "#search" do
    it "searches the play store" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_play_store",
        store: "apps"
      })

      play_store.search(store: "apps")
    end
  end

  describe "#apps" do
    it "searches for apps with a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_play_store",
        store: "apps",
        q: "calculator"
      })

      play_store.apps("calculator")
    end

    it "searches for apps without a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_play_store",
        store: "apps",
        q: nil
      })

      play_store.apps
    end
  end

  describe "#games" do
    it "searches for games with a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_play_store",
        store: "games",
        q: "puzzle"
      })

      play_store.games("puzzle")
    end

    it "searches for games without a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_play_store",
        store: "games",
        q: nil
      })

      play_store.games
    end
  end

  describe "#movies" do
    it "searches for movies with a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_play_store",
        store: "movies",
        q: "action"
      })

      play_store.movies("action")
    end

    it "searches for movies without a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_play_store",
        store: "movies",
        q: nil
      })

      play_store.movies
    end
  end

  describe "#books" do
    it "searches for books with a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_play_store",
        store: "books",
        q: "science fiction"
      })

      play_store.books("science fiction")
    end

    it "searches for books without a query" do
      expect(client).to receive(:get).with("/search", {
        engine: "google_play_store",
        store: "books",
        q: nil
      })

      play_store.books
    end
  end
end
