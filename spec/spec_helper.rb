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