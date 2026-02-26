# frozen_string_literal: true

module SearchApi
  class Error < StandardError; end
  class AuthenticationError < Error; end
  class RateLimitError < Error; end
  class TimeoutError < Error; end
  class NotFoundError < Error; end
  class ValidationError < Error; end
  class ServerError < Error; end
end
