module NatureRemoApi
  module Endpoints
    module Device
      def devices
        get('/1/devices')
      end

      def update_device(device_id:, name:)
        params = {
          name: name
        }

        post("/1/devices/#{device_id}", params)
      end
    end
  end
end