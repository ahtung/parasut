# lib/parasut/options.rb
module Parasut
  # Options
  class Options
    # Attributes
    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :username
    attr_accessor :password
    attr_accessor :company_id
    attr_accessor :grant_type
    attr_accessor :redirect_uri
    attr_accessor :authorize_url

    # Initializer
    def initialize
      @client_id = 'client_id'
      @client_secret = 'client_secret'
      @username = 'username'
      @password = 'password'
      @company_id = 'company_id'
      @authorize_url = 'https://api.parasut.com/oauth/token'
      @grant_type = 'password'
      @redirect_uri = 'urn:ietf:wg:oauth:2.0:oob'
    end
  end
end
