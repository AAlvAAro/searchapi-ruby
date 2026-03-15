<p align="center">
  <img src="assets/logo.svg" alt="SearchApi Ruby — an octopus holding a Ruby gem" width="700" />
</p>

<p align="center">
  <a href="https://rubygems.org/gems/searchapi-ruby"><img src="https://badge.fury.io/rb/searchapi-ruby.svg" alt="Gem Version" /></a>
  <a href="LICENSE.txt"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License" /></a>
</p>

<p align="center">
  <strong>Full-featured Ruby client for <a href="https://www.searchapi.io/">SearchAPI.io</a></strong><br/>
  Access <b>63 search engines</b> from a single, consistent interface.
</p>

<p align="center">
  Google · Bing · Baidu · Yandex · DuckDuckGo · YouTube · Amazon · Walmart · eBay<br/>
  Airbnb · TripAdvisor · Social Media · Ad Libraries · and much more
</p>

---

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
- [Supported Engines](#supported-engines)
- [Usage](#usage)
  <details>
  <summary>All 63 engines...</summary>

  - [Google Search](#google-search)
  - [Google Rank Tracking](#google-rank-tracking)
  - [Google Maps](#google-maps)
  - [Google Maps Place](#google-maps-place)
  - [Google Maps Reviews](#google-maps-reviews)
  - [Google News](#google-news)
  - [Google Scholar](#google-scholar)
  - [Google Shopping](#google-shopping)
  - [Google Flights](#google-flights)
  - [Google Hotels](#google-hotels)
  - [Google Images](#google-images)
  - [Google Videos](#google-videos)
  - [Google Trends](#google-trends)
  - [Google Jobs](#google-jobs)
  - [Google Events](#google-events)
  - [Google Finance](#google-finance)
  - [Google Autocomplete](#google-autocomplete)
  - [Google Local](#google-local)
  - [Google Forums](#google-forums)
  - [Google Shorts](#google-shorts)
  - [Google Patents](#google-patents)
  - [Google Lens](#google-lens)
  - [Google AI Mode](#google-ai-mode)
  - [Google AI Overview](#google-ai-overview)
  - [Google About This Domain](#google-about-this-domain)
  - [Google Ads Transparency Center](#google-ads-transparency-center)
  - [Google Play Store](#google-play-store)
  - [Google Locations](#google-locations)
  - [YouTube](#youtube)
  - [YouTube Transcripts](#youtube-transcripts)
  - [YouTube Video](#youtube-video)
  - [YouTube Comments](#youtube-comments)
  - [YouTube Channel](#youtube-channel)
  - [YouTube Channel Videos](#youtube-channel-videos)
  - [Bing](#bing)
  - [Bing Images](#bing-images)
  - [Bing Videos](#bing-videos)
  - [Baidu](#baidu)
  - [Yandex](#yandex)
  - [Yandex Reverse Image](#yandex-reverse-image)
  - [DuckDuckGo](#duckduckgo)
  - [Yahoo](#yahoo)
  - [Naver](#naver)
  - [Amazon](#amazon)
  - [Walmart](#walmart)
  - [eBay](#ebay)
  - [Shein](#shein)
  - [Airbnb](#airbnb)
  - [Airbnb Property](#airbnb-property)
  - [Airbnb Property Reviews](#airbnb-property-reviews)
  - [TripAdvisor](#tripadvisor)
  - [Apple App Store](#apple-app-store)
  - [Instagram Profile](#instagram-profile)
  - [TikTok Profile](#tiktok-profile)
  - [Facebook Business Page](#facebook-business-page)
  - [LinkedIn Ad Library](#linkedin-ad-library)
  - [Reddit Ad Library](#reddit-ad-library)
  - [Meta Ad Library](#meta-ad-library)
  - [Meta Ad Library Page Search](#meta-ad-library-page-search)
  - [Meta Ad Library Ad Details](#meta-ad-library-ad-details)
  - [Meta Ad Library Page Info](#meta-ad-library-page-info)
  - [TikTok Ads Library](#tiktok-ads-library)
  - [TikTok Ads Library Advertiser Search](#tiktok-ads-library-advertiser-search)

</details>
- [Response Object](#response-object)
- [Error Handling](#error-handling)
- [Advanced Usage](#advanced-usage)
- [Contributing](#contributing)
- [License](#license)

## Installation

Add to your Gemfile:

```ruby
gem "searchapi-ruby"
```

Then run:

```bash
bundle install
```

Or install directly:

```bash
gem install searchapi-ruby
```

## Quick Start

```ruby
require "searchapi"

SearchApi.configure do |config|
  config.api_key = "your_api_key"
end

# Google search
response = SearchApi.google.search("ruby programming language")
puts response.data["organic_results"]

# YouTube search
response = SearchApi.youtube.search("ruby tutorial")
puts response.data["videos"]

# Amazon product search
response = SearchApi.amazon_search.search("wireless headphones")
puts response.data["organic_results"]

# Instagram profile
response = SearchApi.instagram_profile.search(username: "instagram")
puts response.data["profile"]
```

## Configuration

```ruby
SearchApi.configure do |config|
  config.api_key  = ENV["SEARCHAPI_API_KEY"] # default: reads from env
  config.base_url = "https://www.searchapi.io/api/v1" # default
  config.timeout  = 30 # seconds, default
  config.retries  = 2  # automatic retries on 429/5xx, default
  config.logger   = Logger.new($stdout) # optional, for debugging
end
```

## Supported Engines

<details>
<summary><b>View all 63 supported engines</b></summary>

| Category | Engine | Accessor |
|----------|--------|----------|
| **Google** | Google Search | `SearchApi.google` |
| | Google Rank Tracking | `SearchApi.google_rank_tracking` |
| | Google Maps | `SearchApi.google_maps` |
| | Google Maps Place | `SearchApi.google_maps_place` |
| | Google Maps Reviews | `SearchApi.google_maps_reviews` |
| | Google Local | `SearchApi.google_local` |
| | Google News | `SearchApi.google_news` |
| | Google Scholar | `SearchApi.google_scholar` |
| | Google Shopping | `SearchApi.google_shopping` |
| | Google Flights | `SearchApi.google_flights` |
| | Google Hotels | `SearchApi.google_hotels` |
| | Google Images | `SearchApi.google_images` |
| | Google Videos | `SearchApi.google_videos` |
| | Google Shorts | `SearchApi.google_shorts` |
| | Google Trends | `SearchApi.google_trends` |
| | Google Jobs | `SearchApi.google_jobs` |
| | Google Events | `SearchApi.google_events` |
| | Google Finance | `SearchApi.google_finance` |
| | Google Autocomplete | `SearchApi.google_autocomplete` |
| | Google Forums | `SearchApi.google_forums` |
| | Google Patents | `SearchApi.google_patents` |
| | Google Lens | `SearchApi.google_lens` |
| | Google AI Mode | `SearchApi.google_ai_mode` |
| | Google AI Overview | `SearchApi.google_ai_overview` |
| | Google About This Domain | `SearchApi.google_about_this_domain` |
| | Google Ads Transparency | `SearchApi.google_ads_transparency_center` |
| | Google Play Store | `SearchApi.google_play_store` |
| | Google Locations | `SearchApi.google_locations` |
| **Other Search Engines** | Bing | `SearchApi.bing` |
| | Bing Images | `SearchApi.bing_images` |
| | Bing Videos | `SearchApi.bing_videos` |
| | Baidu | `SearchApi.baidu` |
| | Yandex | `SearchApi.yandex` |
| | Yandex Reverse Image | `SearchApi.yandex_reverse_image` |
| | DuckDuckGo | `SearchApi.duckduckgo` |
| | Yahoo | `SearchApi.yahoo` |
| | Naver | `SearchApi.naver` |
| | YouTube | `SearchApi.youtube` |
| | YouTube Transcripts | `SearchApi.youtube_transcripts` |
| | YouTube Video | `SearchApi.youtube_video` |
| | YouTube Comments | `SearchApi.youtube_comments` |
| | YouTube Channel | `SearchApi.youtube_channel` |
| | YouTube Channel Videos | `SearchApi.youtube_channel_videos` |
| **E-commerce** | Amazon | `SearchApi.amazon_search` |
| | Walmart | `SearchApi.walmart_search` |
| | eBay | `SearchApi.ebay_search` |
| | Shein | `SearchApi.shein_search` |
| **Travel** | Airbnb | `SearchApi.airbnb` |
| | Airbnb Property | `SearchApi.airbnb_property` |
| | Airbnb Property Reviews | `SearchApi.airbnb_property_reviews` |
| | TripAdvisor | `SearchApi.tripadvisor` |
| **App Stores** | Apple App Store | `SearchApi.apple_app_store` |
| **Social Media** | Instagram Profile | `SearchApi.instagram_profile` |
| | TikTok Profile | `SearchApi.tiktok_profile` |
| | Facebook Business Page | `SearchApi.facebook_business_page` |
| **Ad Libraries** | LinkedIn Ad Library | `SearchApi.linkedin_ad_library` |
| | Reddit Ad Library | `SearchApi.reddit_ad_library` |
| | Meta Ad Library | `SearchApi.meta_ad_library` |
| | Meta Ad Library Page Search | `SearchApi.meta_ad_library_page_search` |
| | Meta Ad Library Ad Details | `SearchApi.meta_ad_library_ad_details` |
| | Meta Ad Library Page Info | `SearchApi.meta_ad_library_page_info` |
| | TikTok Ads Library | `SearchApi.tiktok_ads_library` |
| | TikTok Ads Library Advertiser Search | `SearchApi.tiktok_ads_library_advertiser_search` |

</details>

## Usage


<details>
<summary><b>Google Search</b></summary>


```ruby
# Basic search
response = SearchApi.google.search("ruby programming")

# With parameters
response = SearchApi.google.search("ruby programming",
  gl: "us",
  hl: "en",
  num: 10,
  page: 1
)
```


</details>

<details>
<summary><b>Google Rank Tracking</b></summary>


```ruby
# Track rankings (up to 100 results per request)
response = SearchApi.google_rank_tracking.search("best crm software", num: 100)

# With location targeting
response = SearchApi.google_rank_tracking.search("plumber near me",
  num: 50,
  location: "New York, NY"
)
```


</details>

<details>
<summary><b>Google Maps</b></summary>


```ruby
# Search for places
response = SearchApi.google_maps.search("restaurants in Tokyo")

# With GPS coordinates
response = SearchApi.google_maps.search("coffee", ll: "@35.6762,139.6503,15z")

# Get place details
response = SearchApi.google_maps.place(data_id: "0x60188b857...")

# Get directions
response = SearchApi.google_maps.directions(
  start: "Tokyo Station",
  destination: "Shibuya Station"
)
```


</details>

<details>
<summary><b>Google Maps Place</b></summary>


```ruby
# By data_id
response = SearchApi.google_maps_place.search(data_id: "0x60188b857...")

# By place_id
response = SearchApi.google_maps_place.search(place_id: "ChIJN1t_tDeuEmsRUsoyG83frY4")

# With localization
response = SearchApi.google_maps_place.search(data_id: "0x60188b857...", hl: "es", gl: "mx")
```


</details>

<details>
<summary><b>Google Maps Reviews</b></summary>


```ruby
# Basic reviews
response = SearchApi.google_maps_reviews.search(data_id: "0x60188b857...")

# With sorting and pagination
response = SearchApi.google_maps_reviews.search(
  data_id: "0x60188b857...",
  sort_by: "newest",
  num: 20
)

# Paginate through results
response = SearchApi.google_maps_reviews.search(
  data_id: "0x60188b857...",
  next_page_token: response.data["serpapi_pagination"]["next_page_token"]
)
```


</details>

<details>
<summary><b>Google News</b></summary>


```ruby
response = SearchApi.google_news.search("artificial intelligence")

# Filter by time period
response = SearchApi.google_news.search("tech startups",
  time_period: "last_week",
  gl: "us"
)
```


</details>

<details>
<summary><b>Google Scholar</b></summary>


```ruby
# Search papers
response = SearchApi.google_scholar.search("machine learning")

# Filter by year
response = SearchApi.google_scholar.search("deep learning",
  as_ylo: 2023,
  as_yhi: 2026
)

# Find citing articles
response = SearchApi.google_scholar.cite("article_id_here")
```


</details>

<details>
<summary><b>Google Shopping</b></summary>


```ruby
response = SearchApi.google_shopping.search("laptop")

# With filters
response = SearchApi.google_shopping.search("headphones",
  sort_by: "price_low_to_high",
  price_min: 50,
  price_max: 200,
  condition: "new"
)
```


</details>

<details>
<summary><b>Google Flights</b></summary>


```ruby
# Round trip
response = SearchApi.google_flights.search(
  from: "JFK",
  to: "LAX",
  outbound_date: "2026-06-15",
  return_date: "2026-06-22"
)

# One way
response = SearchApi.google_flights.search(
  from: "SFO",
  to: "ORD",
  outbound_date: "2026-07-01",
  flight_type: "one_way",
  travel_class: "business"
)
```


</details>

<details>
<summary><b>Google Hotels</b></summary>


```ruby
response = SearchApi.google_hotels.search("hotels in Paris",
  check_in: "2026-06-15",
  check_out: "2026-06-18"
)
```


</details>

<details>
<summary><b>Google Images</b></summary>


```ruby
response = SearchApi.google_images.search("sunset over ocean")

# With filters
response = SearchApi.google_images.search("logo design",
  color: "red",
  size: "large",
  image_type: "clipart"
)
```


</details>

<details>
<summary><b>Google Videos</b></summary>


```ruby
response = SearchApi.google_videos.search("ruby tutorial")

# With filters
response = SearchApi.google_videos.search("cooking pasta",
  duration: "medium",
  time_period: "last_month"
)
```


</details>

<details>
<summary><b>Google Trends</b></summary>


```ruby
# Interest over time
response = SearchApi.google_trends.interest_over_time("ruby, python, javascript")

# Interest by region
response = SearchApi.google_trends.interest_by_region("react", geo: "US")

# Related queries
response = SearchApi.google_trends.related_queries("machine learning")

# Related topics
response = SearchApi.google_trends.related_topics("artificial intelligence")

# Direct search with data_type
response = SearchApi.google_trends.search("web development",
  data_type: "TIMESERIES",
  time: "today 12-m"
)
```


</details>

<details>
<summary><b>Google Jobs</b></summary>


```ruby
response = SearchApi.google_jobs.search("software engineer")

# With filters
response = SearchApi.google_jobs.search("data scientist",
  location: "San Francisco, CA",
  gl: "us"
)
```


</details>

<details>
<summary><b>Google Events</b></summary>


```ruby
response = SearchApi.google_events.search("concerts in Austin")

# Filter by date
response = SearchApi.google_events.search("tech conferences",
  chips: "date:next_week"
)
```


</details>

<details>
<summary><b>Google Finance</b></summary>


```ruby
# Stock quote
response = SearchApi.google_finance.search("NVDA:NASDAQ")

# With time window
response = SearchApi.google_finance.search("AAPL:NASDAQ", window: "1Y")

# Crypto
response = SearchApi.google_finance.search("BTC-USD")
```


</details>

<details>
<summary><b>Google Autocomplete</b></summary>


```ruby
response = SearchApi.google_autocomplete.search("how to learn")

# With client specification
response = SearchApi.google_autocomplete.search("best restaurants",
  client: "chrome",
  gl: "us"
)
```


</details>

<details>
<summary><b>Google Local</b></summary>


```ruby
response = SearchApi.google_local.search("pizza delivery",
  location: "Chicago, IL"
)
```


</details>

<details>
<summary><b>Google Forums</b></summary>


```ruby
response = SearchApi.google_forums.search("best ruby gems 2026",
  time_period: "last_year"
)
```


</details>

<details>
<summary><b>Google Shorts</b></summary>


```ruby
response = SearchApi.google_shorts.search("funny cats")
```


</details>

<details>
<summary><b>Google Patents</b></summary>


```ruby
response = SearchApi.google_patents.search("solar panel efficiency",
  patent_status: "GRANT",
  num: 20
)
```


</details>

<details>
<summary><b>Google Lens</b></summary>


```ruby
response = SearchApi.google_lens.search(
  url: "https://example.com/image.jpg",
  search_type: "products"
)
```


</details>

<details>
<summary><b>Google AI Mode</b></summary>


```ruby
response = SearchApi.google_ai_mode.search("explain quantum computing simply")
```


</details>

<details>
<summary><b>Google AI Overview</b></summary>


```ruby
# Requires a page_token from a prior Google Search response
response = SearchApi.google_ai_overview.search(page_token: "token_from_google_search")
```


</details>

<details>
<summary><b>Google About This Domain</b></summary>


```ruby
response = SearchApi.google_about_this_domain.search(domain: "github.com")
```


</details>

<details>
<summary><b>Google Ads Transparency Center</b></summary>


```ruby
# Search by advertiser
response = SearchApi.google_ads_transparency_center.by_advertiser("AR01234567890")

# Search by domain
response = SearchApi.google_ads_transparency_center.by_domain("example.com",
  region: "US"
)

# Generic search
response = SearchApi.google_ads_transparency_center.search(
  advertiser_id: "AR01234567890",
  region: "US"
)
```


</details>

<details>
<summary><b>Google Play Store</b></summary>


```ruby
# Search apps
response = SearchApi.google_play_store.apps("calculator")

# Browse games
response = SearchApi.google_play_store.games

# Search movies
response = SearchApi.google_play_store.movies("action")

# Search books
response = SearchApi.google_play_store.books("ruby programming")

# Direct search with store parameter
response = SearchApi.google_play_store.search(store: "apps", q: "fitness", gl: "us")
```


</details>

<details>
<summary><b>Google Locations</b></summary>


```ruby
# Find geo-targeting locations for use with other Google engines
response = SearchApi.google_locations.search(q: "new york")

# Limit results
response = SearchApi.google_locations.search(q: "london", limit: 5)
```


</details>

<details>
<summary><b>YouTube</b></summary>


```ruby
response = SearchApi.youtube.search("ruby on rails tutorial")

# With parameters
response = SearchApi.youtube.search("cooking", gl: "us", hl: "en")
```


</details>

<details>
<summary><b>YouTube Transcripts</b></summary>


```ruby
response = SearchApi.youtube_transcripts.search(video_id: "dQw4w9WgXcQ")

# In a specific language
response = SearchApi.youtube_transcripts.search(video_id: "dQw4w9WgXcQ", lang: "es")
```


</details>

<details>
<summary><b>YouTube Video</b></summary>


```ruby
response = SearchApi.youtube_video.search(video_id: "dQw4w9WgXcQ")

# With localization
response = SearchApi.youtube_video.search(video_id: "dQw4w9WgXcQ", gl: "us", hl: "en")
```


</details>

<details>
<summary><b>YouTube Comments</b></summary>


```ruby
response = SearchApi.youtube_comments.search(video_id: "dQw4w9WgXcQ")

# Paginate through comments
response = SearchApi.youtube_comments.search(
  video_id: "dQw4w9WgXcQ",
  next_page_token: response.data["pagination"]["next_page_token"]
)
```


</details>

<details>
<summary><b>YouTube Channel</b></summary>


```ruby
response = SearchApi.youtube_channel.search(channel_id: "UCxxxxxx")

# With localization
response = SearchApi.youtube_channel.search(channel_id: "UCxxxxxx", gl: "us", hl: "en")
```


</details>

<details>
<summary><b>YouTube Channel Videos</b></summary>


```ruby
response = SearchApi.youtube_channel_videos.search(channel_id: "UCxxxxxx")

# Paginate through videos
response = SearchApi.youtube_channel_videos.search(
  channel_id: "UCxxxxxx",
  next_page_token: response.data["pagination"]["next_page_token"]
)
```


</details>

<details>
<summary><b>Bing</b></summary>


```ruby
response = SearchApi.bing.search("artificial intelligence")

# With parameters
response = SearchApi.bing.search("web development",
  num: 30,
  market_code: "en-US"
)
```


</details>

<details>
<summary><b>Bing Images</b></summary>


```ruby
response = SearchApi.bing_images.search("mountain landscape", size: "large")
```


</details>

<details>
<summary><b>Bing Videos</b></summary>


```ruby
response = SearchApi.bing_videos.search("cooking tutorial", duration: "short")
```


</details>

<details>
<summary><b>Baidu</b></summary>


```ruby
response = SearchApi.baidu.search("人工智能", num: 20)
```


</details>

<details>
<summary><b>Yandex</b></summary>


```ruby
response = SearchApi.yandex.search("programming tutorials", lang: "en")
```


</details>

<details>
<summary><b>Yandex Reverse Image</b></summary>


```ruby
response = SearchApi.yandex_reverse_image.search(
  url: "https://example.com/photo.jpg"
)
```


</details>

<details>
<summary><b>DuckDuckGo</b></summary>


```ruby
response = SearchApi.duckduckgo.search("privacy tools", safe: "moderate")
```


</details>

<details>
<summary><b>Yahoo</b></summary>


```ruby
response = SearchApi.yahoo.search("weather forecast",
  yahoo_domain: "search.yahoo.com"
)
```


</details>

<details>
<summary><b>Naver</b></summary>


```ruby
response = SearchApi.naver.search("한국 뉴스", page: 2)
```


</details>

<details>
<summary><b>Amazon</b></summary>


```ruby
response = SearchApi.amazon_search.search("wireless headphones")

# With filters
response = SearchApi.amazon_search.search("organic coffee",
  amazon_domain: "amazon.co.uk",
  sort_by: "price_asc",
  page: 2
)
```


</details>

<details>
<summary><b>Walmart</b></summary>


```ruby
response = SearchApi.walmart_search.search("organic coffee", sort_by: "price_low")
```


</details>

<details>
<summary><b>eBay</b></summary>


```ruby
# Search with query
response = SearchApi.ebay_search.search("vintage watch")

# Browse by category
response = SearchApi.ebay_search.search(category_id: "123")

# With filters
response = SearchApi.ebay_search.search("laptop",
  condition: "new",
  price_min: 500,
  price_max: 1500
)
```


</details>

<details>
<summary><b>Shein</b></summary>


```ruby
response = SearchApi.shein_search.search("summer dress",
  sort_by: "price_asc",
  currency: "USD"
)
```


</details>

<details>
<summary><b>Airbnb</b></summary>


```ruby
response = SearchApi.airbnb.search("Tulum",
  check_in: "2026-06-15",
  check_out: "2026-06-22",
  adults: 2,
  price_max: 200
)
```


</details>

<details>
<summary><b>Airbnb Property</b></summary>


```ruby
# By property ID
response = SearchApi.airbnb_property.search(property_id: "12345678")

# With dates and guests
response = SearchApi.airbnb_property.search(
  property_id: "12345678",
  check_in_date: "2026-06-15",
  check_out_date: "2026-06-22",
  adults: 2
)

# By booking token
response = SearchApi.airbnb_property.search(booking_token: "token_from_search_result")
```


</details>

<details>
<summary><b>Airbnb Property Reviews</b></summary>


```ruby
response = SearchApi.airbnb_property_reviews.search(property_id: "12345678")

# With sorting and pagination
response = SearchApi.airbnb_property_reviews.search(
  property_id: "12345678",
  sort_by: "most_recent",
  page: 2
)
```


</details>

<details>
<summary><b>TripAdvisor</b></summary>


```ruby
response = SearchApi.tripadvisor.search("best restaurants in Rome",
  category: "restaurants"
)
```


</details>

<details>
<summary><b>Apple App Store</b></summary>


```ruby
response = SearchApi.apple_app_store.search(term: "photo editor",
  country: "us",
  num: 50
)
```


</details>

<details>
<summary><b>Instagram Profile</b></summary>


```ruby
response = SearchApi.instagram_profile.search(username: "natgeo")

profile = response.data["profile"]
posts = response.data["posts"]
```


</details>

<details>
<summary><b>TikTok Profile</b></summary>


```ruby
response = SearchApi.tiktok_profile.search(username: "tiktok")

profile = response.data["profile"]
```


</details>

<details>
<summary><b>Facebook Business Page</b></summary>


```ruby
# By username
response = SearchApi.facebook_business_page.by_username("cocacola")

# By page ID
response = SearchApi.facebook_business_page.by_page_id("123456789")

# Generic search
response = SearchApi.facebook_business_page.search(username: "nasa")
```


</details>

<details>
<summary><b>LinkedIn Ad Library</b></summary>


```ruby
response = SearchApi.linkedin_ad_library.search(
  advertiser: "Google",
  country: "US"
)
```


</details>

<details>
<summary><b>Reddit Ad Library</b></summary>


```ruby
response = SearchApi.reddit_ad_library.search(
  q: "gaming",
  industry: "GAMING",
  budget_category: "HIGH"
)
```


</details>

<details>
<summary><b>Meta Ad Library</b></summary>


```ruby
response = SearchApi.meta_ad_library.search(
  q: "sneakers",
  active_status: "active",
  platforms: "instagram"
)
```


</details>

<details>
<summary><b>Meta Ad Library Page Search</b></summary>


```ruby
# Search for advertiser pages
response = SearchApi.meta_ad_library_page_search.search(q: "Nike")

# With filters
response = SearchApi.meta_ad_library_page_search.search(
  q: "Nike",
  country: "US",
  ad_type: "political"
)
```


</details>

<details>
<summary><b>Meta Ad Library Ad Details</b></summary>


```ruby
response = SearchApi.meta_ad_library_ad_details.search(ad_archive_id: "123456789")

# Political ad with regional transparency data
response = SearchApi.meta_ad_library_ad_details.search(
  ad_archive_id: "123456789",
  is_political: true,
  country: "US",
  page_id: "987654321"
)
```


</details>

<details>
<summary><b>Meta Ad Library Page Info</b></summary>


```ruby
response = SearchApi.meta_ad_library_page_info.search(page_id: "123456789")
```


</details>

<details>
<summary><b>TikTok Ads Library</b></summary>


```ruby
response = SearchApi.tiktok_ads_library.search(
  q: "fashion",
  country: "US",
  sort_by: "last_shown_date_newest_to_oldest"
)
```


</details>
<details>
<summary><b>TikTok Ads Library Advertiser Search</b></summary>


```ruby
response = SearchApi.tiktok_ads_library_advertiser_search.search(q: "Nike")
```


</details>

## Response Object

Every API call returns a `SearchApi::Response`:

```ruby
response = SearchApi.google.search("ruby")

response.success?          # => true
response.status            # => 200
response.data              # => parsed JSON hash (full response)
response.results           # => same as data when it's a Hash
response.headers           # => response headers
response.credits_remaining # => remaining API credits (integer)
```

## Error Handling

All errors inherit from `SearchApi::Error`:

```ruby
begin
  SearchApi.google.search("ruby")
rescue SearchApi::AuthenticationError => e
  # Invalid or missing API key (401)
rescue SearchApi::RateLimitError => e
  # Too many requests (429)
rescue SearchApi::NotFoundError => e
  # Resource not found (404)
rescue SearchApi::TimeoutError => e
  # Request timed out or connection failed
rescue SearchApi::ServerError => e
  # Server-side error (5xx)
rescue SearchApi::Error => e
  # Catch-all for any SearchApi error
end
```

Automatic retries are built in for `429`, `500`, `502`, and `503` status codes (configurable via `config.retries`).

## Advanced Usage

### Custom Client Instance

You can create a standalone client instead of using the global module:

```ruby
config = SearchApi::Configuration.new
config.api_key = "different_api_key"
config.timeout = 60

client = SearchApi::Client.new(config)
google = SearchApi::Resources::Google.new(client)

response = google.search("ruby programming")
```

### Common Parameters

Most Google engines support these shared parameters:

| Parameter | Description | Example |
|-----------|-------------|---------|
| `gl` | Country code (ISO 3166-1 alpha-2) | `"us"`, `"gb"`, `"jp"` |
| `hl` | Language code | `"en"`, `"es"`, `"ja"` |
| `location` | Geo-targeting location | `"New York, NY"` |
| `device` | Device type | `"desktop"`, `"mobile"`, `"tablet"` |
| `page` | Pagination | `1`, `2`, `3` |
| `safe` | SafeSearch | `"active"`, `"off"` |
| `num` | Results per page | `10`, `20`, `100` |

See the [SearchAPI documentation](https://www.searchapi.io) for the full parameter reference of each engine.

### Zero Retention (Enterprise)

Disable data logging for compliance scenarios:

```ruby
response = SearchApi.google.search("sensitive query", zero_retention: true)
```

## Contributing

Bug reports and pull requests are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

Released under the [MIT License](LICENSE.txt).
