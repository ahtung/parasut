require "singleton"

# lib/parasut/options.rb
module Parasut
  # Options
  class Options
    include Singleton

    ATTRIBUTES = [:client_id, :client_secret, :username, :password, :company_id, :grant_type, :redirect_uri, :authorize_url]

    # Attributes
    attr_accessor *ATTRIBUTES
  end

  # Initializer
  def self.options
    if block_given?
      yield Options.instance
    end
    Options.instance
  end
end
