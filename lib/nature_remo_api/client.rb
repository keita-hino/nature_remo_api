module NatureRemoApi
  class Client
    # TODO: NatureRemoApi::Config::ATTRIBUTESを下記に設定できるようにする
    attr_accessor :endpoint, :api_key, :default_max_retries

    def initialize(options = {})
      NatureRemoApi::Config::ATTRIBUTES.each do |key|
        send("#{key}=", options.fetch(key, NatureRemoApi.config.send(key)))
      end
      @api_key ||= NatureRemoApi.config.api_key
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
end