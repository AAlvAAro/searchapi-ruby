# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/), and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.0.0] - 2026-02-21

### Added

- **42 new search engine resources** (49 total):
  - Google: Search (SERP), Rank Tracking, Scholar, Shopping, Images, Videos, Trends, Jobs, Events, Finance, Autocomplete, Local, Forums, Shorts, Patents, Lens, AI Mode, AI Overview, About This Domain, Ads Transparency Center, Play Store
  - Other search engines: Bing, Bing Images, Bing Videos, Baidu, Yandex, Yandex Reverse Image, DuckDuckGo, Yahoo, Naver
  - E-commerce: Amazon Search, Walmart Search, eBay Search, Shein Search
  - App stores: Apple App Store
  - Social media: Instagram Profile, TikTok Profile, Facebook Business Page
  - Ad libraries: LinkedIn Ad Library, Reddit Ad Library, Meta Ad Library, TikTok Ads Library
- **Dynamic resource registry** with `method_missing`-based accessor pattern for clean API
- **Convenience methods** for Google Trends (`interest_over_time`, `interest_by_region`, `related_queries`, `related_topics`)
- **Convenience methods** for Google Scholar (`cite`)
- **Convenience methods** for Google Ads Transparency Center (`by_advertiser`, `by_domain`)
- **Convenience methods** for Google Play Store (`apps`, `games`, `movies`, `books`)
- **Convenience methods** for Facebook Business Page (`by_username`, `by_page_id`)
- CONTRIBUTING.md with development guidelines
- Comprehensive README with usage examples for all 49 engines
- Full RSpec test coverage (242 examples)

### Changed

- Refactored module-level resource accessors to use a registry pattern instead of individual memoized methods
- Updated gemspec description to reflect the full scope of supported engines

## [0.1.0] - 2026-02-15

### Added

- Initial release
- Base client with Faraday HTTP, error handling, automatic retries
- `SearchApi::Configuration` with sensible defaults
- `SearchApi::Response` wrapper with `success?`, `data`, `credits_remaining`
- Error hierarchy: `AuthenticationError`, `RateLimitError`, `TimeoutError`, `NotFoundError`, `ServerError`
- Google Maps: search, place details, directions
- Google Hotels: search with check-in/check-out dates
- Google Flights: one-way and round-trip search
- TripAdvisor: search
- Airbnb: search with dates
- YouTube: search
- Google News: search
