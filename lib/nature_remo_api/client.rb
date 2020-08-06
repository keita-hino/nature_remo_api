require 'faraday'
require 'json'
require_relative "endpoints"

module NatureRemoApi
  class Client
    include Endpoints

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

    # TODO: BaseClientを作ってそちらに定義
    Faraday::Connection::METHODS.each do |method|
      define_method(method) do |url, args = {}, &block|
        response = client.__send__(method, url, args.reject {|_k, v| v.nil? }).body
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