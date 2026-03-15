# frozen_string_literal: true

require_relative "lib/searchapi/version"

Gem::Specification.new do |spec|
  spec.name          = "searchapi-ruby"
  spec.version       = SearchApi::VERSION
  spec.authors       = ["aalvaaro"]
  spec.email         = ["hola@alvarodelgado.dev"]

  spec.summary       = "Ruby client for SearchAPI.io - 63 search engines in one gem"
  spec.description   = "Full-featured Ruby client for SearchAPI.io. Access 63 search engines including Google, Bing, Baidu, Yandex, DuckDuckGo, YouTube, Amazon, Walmart, Airbnb, TripAdvisor, social media profiles, ad libraries, and more."
  spec.homepage      = "https://github.com/aalvaaro/searchapi-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    Dir["{lib}/**/*", "LICENSE.txt", "README.md", "CHANGELOG.md"]
  end

  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 2.0", "< 3.0"
  spec.add_dependency "faraday-retry", "~> 2.0"
end
