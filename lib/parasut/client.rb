module Parasut
  # Parasut::Client
  class Client
    API_VERSION = 'v1'.freeze
    BASE_URL = "#{oauth_strategy.default_options[:client_options][:site]}/oauth/token".freeze

    def initialize
    end

    def me
      resp = RestClient.get("#{oauth_strategy.default_options[:client_options][:site]}/#{API_VERSION}/me", Authorization: "Bearer #{@access_token}")
      JSON.parse(resp)
    end

    def oauth_strategy
      OmniAuth::Strategies::Parasut
    end

    private

    def access_token
      resp = RestClient.post("#{BASE_URL}?client_id=#{ENV['PARASUT_CLIENT_ID']}&client_secret=#{ENV['PARASUT_CLIENT_SECRET']}&username=dunyakirkali@ahtung.co&password=dE3kI812&grant_type=password&redirect_uri=urn:ietf:wg:oauth:2.0:oob", {})
      JSON.parse(resp)['access_token']
    end
  end
end
