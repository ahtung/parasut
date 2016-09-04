require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'parasut'
# require 'oauth2'

# OAUTH_CLIENT = OAuth2::Client.new(
#   ENV['PARASUT_API_CLIENT_ID'],
#   ENV['PARASUT_API_CLIENT_SECRET'],
#   site: ENV['PARASUT_API_AUTH_ENDPOINT']
# )
#
# OAUTH_TOKEN = OAuth2::AccessToken.from_hash OAUTH_CLIENT, access_token: ENV['PARASUT_API_ACCESS_TOKEN']

RSpec.configure do |config|
  config.before(:suite) do
    Parasut.options do |options|
      options.client_id = ENV['PARASUT_CLIENT_ID']
      options.client_secret = ENV['PARASUT_CLIENT_SECRET']
      options.username = ENV['PARASUT_USERNAME']
      options.password = ENV['PARASUT_PASSWORD']
      options.company_id = 'company_id'
    end
  end
end
