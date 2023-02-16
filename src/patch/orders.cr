module Patch
  class Order
    def initialize(api_key : String)
      @client = Patch::Client.new(api_key).reset_client
    end

    def get_order(order_slug : String)
      @client.get("/v1/orders/#{order_slug}")
    end

    def list_orders(page : Int64, metadata_key : String? = nil, metadata_value : String? = nil)
      if metadata_key && metadata_value
        @client.get("/v1/orders?page=#{page}&metadata[#{metadata_key}]=#{metadata_value}")
      else
        @client.get("/v1/orders?page=#{page}")
      end
    end

    def create_order(data : Hash(String, String))
      @client.post("/v1/orders/", data: data)
    end

    def update_order(order_id : String, line_item_id : String, data : Hash(String, String))
      @client.patch("/v1/orders/#{order_id}/line_items/#{line_item_id}", data: data)
    end

    def delete_order(order_id : String, line_item_id : String)
      @client.delete("/v1/orders/#{order_id}/line_items/#{line_item_id}")
    end

    def place_order(order_id : String)
      @client.patch("/v1/orders/#{order_id}/place")
    end

    def cancel_order(order_id : String)
      @client.patch("/v1/orders/#{order_id}/cancel")
    end

    def delete_draft_order(order_id : String)
      @client.delete("/v1/orders/#{order_id}")
    end
  end
end
