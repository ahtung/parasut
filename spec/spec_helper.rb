require 'coveralls'
Coveralls.wear!

require 'webmock/rspec'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'parasut'

RSpec.configure do |config|
  config.before(:suite) do
    Parasut.options do |options|
      options.client_id = ENV['PARASUT_CLIENT_ID']
      options.client_secret = ENV['PARASUT_CLIENT_SECRET']
      options.username = ENV['PARASUT_USERNAME']
      options.password = ENV['PARASUT_PASSWORD']
      options.company_id = ENV['PARASUT_COMPANY_ID']
    end
  end

  config.before(:each) do
    stub_request(:post, "https://api.parasut.com/oauth/token?client_id=#{ENV['PARASUT_CLIENT_ID']}&client_secret=#{ENV['PARASUT_CLIENT_SECRET']}&grant_type=password&password=#{ENV['PARASUT_PASSWORD']}&redirect_uri=urn:ietf:wg:oauth:2.0:oob&username=#{ENV['PARASUT_USERNAME']}")
      .to_return(status: 200, body: '{"access_token":"e9e13c1dec7e2f6c9550f8eb1801cf48e8b8caaca611508ff3330155f8bfbe99","token_type":"bearer","expires_in":7200,"refresh_token":"a880825d3e1ee8b0ad5dd5b0ed099d11aa175934fc63190149750589833242bf","scope":"public","created_at":1473538387}'.to_json, headers: {})

    stub_request(:post, "https://api.parasut.com/oauth/token?client_id=#{ENV['PARASUT_CLIENT_ID']}&client_secret=#{ENV['PARASUT_CLIENT_SECRET']}&grant_type=refresh_token&refresh_token=refresh_token")
      .to_return(status: 200, body: '{"access_token":"e9e13c1dec7e2f6c9550f8eb1801cf48e8b8caaca611508ff3330155f8bfbe99","token_type":"bearer","expires_in":7200,"refresh_token":"a880825d3e1ee8b0ad5dd5b0ed099d11aa175934fc63190149750589833242bf","scope":"public","created_at":1473538387}'.to_json, headers: {})

    stub_request(:get, 'https://api.parasut.com/v1/me')
      .to_return(status: 200, body: '', headers: {})

    stub_request(:get, 'https://api.parasut.com/v1/100174/contacts/1205839')
      .to_return(status: 200, body: { contact: { id: '1205839' } }.to_json, headers: {})

    stub_request(:delete, 'https://api.parasut.com/v1/100174/contacts/1205839')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})

    stub_request(:get, 'https://api.parasut.com/v1/100174/contacts')
      .to_return(status: 200, body: { items: [{ id: '1205839' }] }.to_json, headers: {})

    stub_request(:post, 'https://api.parasut.com/v1/100174/contacts').to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})
  end
end
