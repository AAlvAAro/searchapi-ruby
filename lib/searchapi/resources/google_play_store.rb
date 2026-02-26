# frozen_string_literal: true

module SearchApi
  module Resources
    class GooglePlayStore < Resource
      def search(store:, **params)
        get(store: store, **params)
      end

      def apps(query = nil, **params)
        search(store: "apps", q: query, **params)
      end

      def games(query = nil, **params)
        search(store: "games", q: query, **params)
      end

      def movies(query = nil, **params)
        search(store: "movies", q: query, **params)
      end

      def books(query = nil, **params)
        search(store: "books", q: query, **params)
      end

      private

      def engine_name
        "google_play_store"
      end
    end
  end
end
