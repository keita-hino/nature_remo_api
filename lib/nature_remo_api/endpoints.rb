require_relative 'endpoints/user'
require_relative 'endpoints/device'
require_relative 'endpoints/appliance'
require_relative 'endpoints/signal'

module NatureRemoApi
  module Endpoints
    include User
    include Device
    include Appliance
    include Signal
  end
end