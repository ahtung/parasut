module Parasut
  class Client
    attr_reader :access_token

    BASE_URL = 'https://api.parasut.com'
    AUTH_PATH = '/oauth/authorize'
    TOKEN_PATH = '/oauth/token'
    API_VERSION = '/v1'

    def initialize(access_token)
      strategy = OmniAuth::Strategies::Parasut.new(nil, ENV['PARASUT_CLIENT_ID'], ENV['PARASUT_CLIENT_SECRET'])
      # @access_token = access_token
      # RestClient.add_before_execution_proc do |req, params|
      #   @access_token.sign! req
      # end
    end

    def health
      RestClient.get(api_root_url)
    end

    private

    def api_root_url
      [BASE_URL, API_VERSION].join
    end
  end
end
