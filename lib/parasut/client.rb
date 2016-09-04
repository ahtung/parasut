module Parasut
  class Client
    attr_reader :access_token

    API_VERSION = 'v1'

    def initialize(access_token)
      strategy = OmniAuth::Strategies::Parasut.new(nil, ENV['PARASUT_CLIENT_ID'], ENV['PARASUT_CLIENT_SECRET'])
      @access_token = strategy.client.auth_code.get_token('password', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob')
      RestClient.add_before_execution_proc do |req, params|
        @access_token.sign! req
      end
    end

    def health
      RestClient.get('/')
    end
  end
end
