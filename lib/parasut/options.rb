# lib/parasut/options.rb
module Parasut
  # Options
  class Options
    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :username
    attr_accessor :password
    attr_accessor :company_id
    attr_accessor :grant_type
    attr_accessor :redirect_uri
  end
end
