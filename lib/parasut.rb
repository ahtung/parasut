require 'rest-client'
require 'uri'
require 'pry'

require_relative 'parasut/version'
require_relative 'parasut/options'
require_relative 'parasut/contact'
require_relative 'parasut/client'
require_relative 'parasut/account'

# lib/parasut.rb
module Parasut
  API_VERSION = 'v1'.freeze
  BASE_URL = 'https://api.parasut.com'.freeze
end
