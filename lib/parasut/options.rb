require 'singleton'

# lib/parasut/options.rb
module Parasut
  # Options
  class Options
    include Singleton

    ATTRIBUTES = [:client_id, :client_secret, :username, :password, :company_id].freeze

    # Attributes
    attr_accessor *ATTRIBUTES
  end

  # Initializer
  def self.options
    yield Options.instance if block_given?
    Options.instance
  end
end
