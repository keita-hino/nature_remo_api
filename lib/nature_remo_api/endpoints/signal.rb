module NatureRemoApi
  module Endpoints
    module Signal
      def signals(appliance_id:)
        get("/1/appliances/#{appliance_id}/signals")
      end

      def send_signal(signal_id:)
        params = {
          signal: signal_id
        }

        post("/1/signals/#{signal_id}/send", params)
      end
    end
  end
end