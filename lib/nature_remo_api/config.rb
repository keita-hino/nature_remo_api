module NatureRemoApi
  module Config
    extend self

    ATTRIBUTES = %i[
      endpoint
      access_token
      default_max_retries
    ].freeze

    attr_accessor(*Config::ATTRIBUTES)

    def reset
      self.endpoint = 'https://api.nature.global/'
      self.access_token = nil
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