# lib/parasut/options.rb
module Parasut
  # Options
  class Options
    ATTRIBUTES = [:client_id, :client_secret, :username, :password, :company_id, :grant_type, :redirect_uri, :authorize_url]

    # Attributes
    attr_accessor *ATTRIBUTES

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
