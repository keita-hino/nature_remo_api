module NatureRemoApi
  module Config
    extend self

    ATTRIBUTES = %i[
      api_key
      default_max_retries
    ].freeze

    attr_accessor(*Config::ATTRIBUTES)

    def reset
      self.api_key = nil
      self.default_max_retries = 10
    end

  end

  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end
end
NatureRemoApi::Config.reset