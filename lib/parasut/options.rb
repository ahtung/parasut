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

    # Initializer
    def initialize
      @client_id = 'client_id'
      @client_secret = 'client_secret'
      @username = 'username'
      @password = 'password'
      @company_id = 'company_id'
      @grant_type = 'grant_type'
      @redirect_uri = 'redirect_uri'
    end
  end
end
