require 'spec_helper'

RSpec.describe Parasut::Client do
  it 'should have API_VERSION defined' do
    expect(Parasut::Client.const_defined?('API_VERSION')).not_to be_nil
  end

  describe '#' do
    describe 'me' do
      xit 'should return 200' do
        token = OAuth2::AccessToken.new(nil, 'access_token')
        client = Parasut::Client.new(token)
        expect(client.me.resp.status_code).to eq(200)
      end
    end
  end
end
