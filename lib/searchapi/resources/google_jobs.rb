# frozen_string_literal: true

module SearchApi
  module Resources
    class GoogleJobs < Resource
      def search(query, **params)
        get(q: query, **params)
      end

      private

      def engine_name
        "google_jobs"
      end
    end
  end
end
