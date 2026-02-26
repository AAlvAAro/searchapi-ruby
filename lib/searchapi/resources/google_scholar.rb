# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleScholar < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      def cite(article_id, **params)
        get(cites: article_id, **params)
      end

      private

      def engine_name
        "google_scholar"
      end
    end
  end
end
