module Parasut
  class Client
    attr_reader :access_token

    API_VERSION = 'v1'.freeze

    def initialize(access_token)
      strategy = OmniAuth::Strategies::Parasut.new(ENV['PARASUT_CLIENT_ID'], ENV['PARASUT_CLIENT_SECRET'], authorize_params: {:foo => "bar", :baz => "zip"},
        token_params: { username: 'dunyakirkali', password: 'dE3kI812', grant_type: 'password' })
      @access_token = strategy.client.auth_code.get_token('password', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob')
      RestClient.add_before_execution_proc do |req, params|
        @access_token.sign! req
      end
    end

    def me
      RestClient.get("/#{API_VERSION}/me")
    end
  end
end
