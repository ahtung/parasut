require 'webmock/rspec'
require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'parasut'

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
