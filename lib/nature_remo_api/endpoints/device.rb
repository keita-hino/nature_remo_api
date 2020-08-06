module NatureRemoApi
  module Endpoints
    module Device
      def devices
        get('/1/devices')
      end
    end
  end
end