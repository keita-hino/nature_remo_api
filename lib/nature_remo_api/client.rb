require 'faraday'
require 'json'

module NatureRemoApi
  class Client
    # TODO: NatureRemoApi::Config::ATTRIBUTESを下記に設定できるようにする
    attr_accessor :endpoint, :access_token, :default_max_retries, :client

    def initialize(options = {})
      NatureRemoApi::Config::ATTRIBUTES.each do |key|
        send("#{key}=", options.fetch(key, NatureRemoApi.config.send(key)))
      end
      @access_token ||= NatureRemoApi.config.access_token
      @client = Faraday.new(url: endpoint)
      @client.headers['Authorization'] = "Bearer #{access_token}"
    end

    def user_me
      get('/1/users/me')
    end

    def devices
      get('/1/devices')
    end

    # TODO: BaseClientを作ってそちらに定義
    Faraday::Connection::METHODS.each do |method|
      define_method(method) do |url, args = {}, &block|
        response = client.__send__(method, url).body
        JSON.parse(response)
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
end