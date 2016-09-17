require 'her'
require 'her/middleware/o_auth_provider_header'
require 'her/middleware/parasut_parser'
require 'json'
require 'uri'
require 'kaminari/config'
require 'kaminari/helpers/action_view_extension'
require 'kaminari/helpers/paginator'
require 'kaminari/models/page_scope_methods'
require 'kaminari/models/configuration_methods'
require 'kaminari/hooks'
require 'rest_client'
require 'pry'

Kaminari::Hooks.init

Her::API.setup url: "https://api.parasut.com/v1/#{ENV['PARSUT_COMPANY_ID']}" do |config|
  config.use Her::Middleware::ParasutParser
  config.use Faraday::Request::UrlEncoded
  config.use Her::Middleware::OAuthProviderHeader
  config.use Faraday::Adapter::NetHttp
end

require_relative 'parasut/version'
require_relative 'parasut/options'
require_relative 'parasut/paginated'
require_relative 'parasut/product'
require_relative 'parasut/contact'
require_relative 'parasut/item_category'
require_relative 'parasut/account'
require_relative 'parasut/sales_invoice'

# lib/parasut.rb
module Parasut
end
