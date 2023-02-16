module Patch
  class Estimate
    def initialize(api_key : String)
      @client = Patch::Client.new(api_key).reset_client
    end

    def retrieve_estimate(estimate_id : String)
      @client.get("/v1/estimates/#{estimate_id}")
    end

    def list_estimates
      @client.get("/v1/estimates")
    end

    def create_bitcoin_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/crypto/btc", data: data)
    end

    def create_ethereum_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/crypto/eth", data: data)
    end

    def create_ecommerce_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/ecommerce", data: data)
    end

    def create_flight_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/flight", data: data)
    end

    def create_hotel_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/hotel", data: data)
    end

    def create_mass_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/mass", data: data)
    end

    def create_air_shipping_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/shipping/air", data: data)
    end

    def create_rail_shipping_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/shipping/rail", data: data)
    end

    def create_road_shipping_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/shipping/road", data: data)
    end

    def create_sea_shipping_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/shipping/sea", data: data)
    end

    def create_vehicle_shipping_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/shipping/vehicle", data: data)
    end

    def create_flight_shipping_estimate(data : Hash(String, String))
      @client.post("/v1/estimates/shipping/flight", data: data)
    end
  end
end
