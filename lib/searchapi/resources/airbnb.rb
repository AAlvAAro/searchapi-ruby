# frozen_string_literal: true

module SearchApi
  module Resources
    class Airbnb < Resource
      def search(query, check_in:, check_out:, **params)
        get(q: query, check_in: check_in, check_out: check_out, **params)
      end

      private

      def engine_name
        "airbnb"
      end
    end
  end
end
