module Parasut
  # Parasut::Client
  class Client
    API_VERSION = 'v1'.freeze
    BASE_URL = 'https://api.parasut.com/oauth/token'.freeze

    def initialize
    end

    def me
      RestClient.get("#{oauth_strategy.default_options[:client_options][:site]}/#{API_VERSION}/me", Authorization: "Bearer #{refresh_token['access_token']}")
    end

    def oauth_strategy
      OmniAuth::Strategies::Parasut
    end

    private

    def refresh_token
      resp = RestClient.post("#{BASE_URL}?client_id=#{ENV['PARASUT_CLIENT_ID']}&client_secret=#{ENV['PARASUT_CLIENT_SECRET']}&grant_type=refresh_token&refresh_token=#{password['refresh_token']}", {})
      JSON.parse(resp)
    end

    def password
      resp = RestClient.post("#{BASE_URL}?client_id=#{ENV['PARASUT_CLIENT_ID']}&client_secret=#{ENV['PARASUT_CLIENT_SECRET']}&username=dunyakirkali@ahtung.co&password=dE3kI812&grant_type=password&redirect_uri=urn:ietf:wg:oauth:2.0:oob", {})
      JSON.parse(resp)
    end
  end
end
