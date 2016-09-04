module Parasut
  # Parasut::Client
  class Client
    API_VERSION = 'v1'.freeze
    BASE_URL = 'https://api.parasut.com'.freeze

    def initialize
    end

    def me
      RestClient.get("#{BASE_URL}/#{API_VERSION}/me", Authorization: "Bearer #{refresh_token['access_token']}")
    end

    private

    def refresh_token
      resp = RestClient.post("#{BASE_URL}?client_id=#{Parasut.options.client_id}&client_secret=#{Parasut.options.client_secret}&grant_type=refresh_token&refresh_token=#{password['refresh_token']}", {})
      JSON.parse(resp)
    end

    def password
      resp = RestClient.post("#{BASE_URL}?client_id=#{Parasut.options.client_id}&client_secret=#{Parasut.options.client_secret}&username=#{Parasut.options.username}&password=#{Parasut.options.password}&grant_type=password&redirect_uri=urn:ietf:wg:oauth:2.0:oob", {})
      JSON.parse(resp)
    end
  end
end
