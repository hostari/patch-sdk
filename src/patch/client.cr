module Bentonow
  class Client
    private getter api_key : String

    BASE_URI = "api.patch.io"

    def initialize(@api_key)
    end

    def reset_client
      HTTP::Client.new(BASE_URI, port: 443, tls: true).tap do |client|
        client.before_request do |request|
          request.headers["Authorization"] = "Bearer #{api_key}"
          request.headers["Content-Type"] = "application/json"
        end
      end
    end
  end
end
