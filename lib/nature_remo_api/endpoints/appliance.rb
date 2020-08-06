module NatureRemoApi
  module Endpoints
    module Appliance
      def appliances
        get('/1/appliances')
      end
    end
  end
end