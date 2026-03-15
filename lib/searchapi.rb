# frozen_string_literal: true

require_relative "searchapi/version"
require_relative "searchapi/configuration"
require_relative "searchapi/error"
require_relative "searchapi/response"
require_relative "searchapi/client"
require_relative "searchapi/resource"

# Google engines
require_relative "searchapi/resources/google"
require_relative "searchapi/resources/google_rank_tracking"
require_relative "searchapi/resources/google_events"
require_relative "searchapi/resources/google_maps"
require_relative "searchapi/resources/google_maps_place"
require_relative "searchapi/resources/google_maps_reviews"
require_relative "searchapi/resources/google_scholar"
require_relative "searchapi/resources/google_news"
require_relative "searchapi/resources/google_jobs"
require_relative "searchapi/resources/google_shopping"
require_relative "searchapi/resources/google_flights"
require_relative "searchapi/resources/google_images"
require_relative "searchapi/resources/google_videos"
require_relative "searchapi/resources/google_trends"
require_relative "searchapi/resources/google_autocomplete"
require_relative "searchapi/resources/google_finance"
require_relative "searchapi/resources/google_hotels"
require_relative "searchapi/resources/google_about_this_domain"
require_relative "searchapi/resources/google_ai_mode"
require_relative "searchapi/resources/google_ads_transparency_center"
require_relative "searchapi/resources/google_local"
require_relative "searchapi/resources/google_shorts"
require_relative "searchapi/resources/google_lens"
require_relative "searchapi/resources/google_forums"
require_relative "searchapi/resources/google_patents"
require_relative "searchapi/resources/google_ai_overview"
require_relative "searchapi/resources/google_play_store"

# Other search engines
require_relative "searchapi/resources/amazon_search"
require_relative "searchapi/resources/bing"
require_relative "searchapi/resources/bing_images"
require_relative "searchapi/resources/bing_videos"
require_relative "searchapi/resources/baidu"
require_relative "searchapi/resources/yandex"
require_relative "searchapi/resources/yandex_reverse_image"
require_relative "searchapi/resources/duckduckgo"
require_relative "searchapi/resources/yahoo"
require_relative "searchapi/resources/naver"
require_relative "searchapi/resources/youtube"

# App stores
require_relative "searchapi/resources/apple_app_store"

# E-commerce
require_relative "searchapi/resources/walmart_search"
require_relative "searchapi/resources/shein_search"
require_relative "searchapi/resources/ebay_search"

# Travel & hospitality
require_relative "searchapi/resources/airbnb"
require_relative "searchapi/resources/airbnb_property"
require_relative "searchapi/resources/airbnb_property_reviews"
require_relative "searchapi/resources/tripadvisor"

# Social media profiles
require_relative "searchapi/resources/instagram_profile"
require_relative "searchapi/resources/tiktok_profile"
require_relative "searchapi/resources/facebook_business_page"

# Ad libraries
require_relative "searchapi/resources/linkedin_ad_library"
require_relative "searchapi/resources/reddit_ad_library"
require_relative "searchapi/resources/meta_ad_library"
require_relative "searchapi/resources/tiktok_ads_library"

module SearchApi
  # Registry mapping accessor names to resource classes.
  RESOURCES = {
    # Google engines
    google: Resources::Google,
    google_rank_tracking: Resources::GoogleRankTracking,
    google_events: Resources::GoogleEvents,
    google_maps: Resources::GoogleMaps,
    google_maps_place: Resources::GoogleMapsPlace,
    google_maps_reviews: Resources::GoogleMapsReviews,
    google_scholar: Resources::GoogleScholar,
    google_news: Resources::GoogleNews,
    google_jobs: Resources::GoogleJobs,
    google_shopping: Resources::GoogleShopping,
    google_flights: Resources::GoogleFlights,
    google_images: Resources::GoogleImages,
    google_videos: Resources::GoogleVideos,
    google_trends: Resources::GoogleTrends,
    google_autocomplete: Resources::GoogleAutocomplete,
    google_finance: Resources::GoogleFinance,
    google_hotels: Resources::GoogleHotels,
    google_about_this_domain: Resources::GoogleAboutThisDomain,
    google_ai_mode: Resources::GoogleAiMode,
    google_ads_transparency_center: Resources::GoogleAdsTransparencyCenter,
    google_local: Resources::GoogleLocal,
    google_shorts: Resources::GoogleShorts,
    google_lens: Resources::GoogleLens,
    google_forums: Resources::GoogleForums,
    google_patents: Resources::GooglePatents,
    google_ai_overview: Resources::GoogleAiOverview,
    google_play_store: Resources::GooglePlayStore,

    # Other search engines
    amazon_search: Resources::AmazonSearch,
    bing: Resources::Bing,
    bing_images: Resources::BingImages,
    bing_videos: Resources::BingVideos,
    baidu: Resources::Baidu,
    yandex: Resources::Yandex,
    yandex_reverse_image: Resources::YandexReverseImage,
    duckduckgo: Resources::DuckDuckGo,
    yahoo: Resources::Yahoo,
    naver: Resources::Naver,
    youtube: Resources::YouTube,

    # App stores
    apple_app_store: Resources::AppleAppStore,

    # E-commerce
    walmart_search: Resources::WalmartSearch,
    shein_search: Resources::SheinSearch,
    ebay_search: Resources::EbaySearch,

    # Travel & hospitality
    airbnb: Resources::Airbnb,
    airbnb_property: Resources::AirbnbProperty,
    airbnb_property_reviews: Resources::AirbnbPropertyReviews,
    tripadvisor: Resources::TripAdvisor,

    # Social media profiles
    instagram_profile: Resources::InstagramProfile,
    tiktok_profile: Resources::TiktokProfile,
    facebook_business_page: Resources::FacebookBusinessPage,

    # Ad libraries
    linkedin_ad_library: Resources::LinkedinAdLibrary,
    reddit_ad_library: Resources::RedditAdLibrary,
    meta_ad_library: Resources::MetaAdLibrary,
    tiktok_ads_library: Resources::TiktokAdsLibrary
  }.freeze

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def client
      @client ||= Client.new(configuration)
    end

    def reset!
      @configuration = nil
      @client = nil
      @resources = nil
    end

    def resources
      @resources ||= {}
    end

    def method_missing(name, *args, &block)
      if RESOURCES.key?(name)
        resources[name] ||= RESOURCES[name].new(client)
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      RESOURCES.key?(name) || super
    end
  end
end
