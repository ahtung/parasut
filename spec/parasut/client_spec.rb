require 'spec_helper'

RSpec.describe Parasut::Client do
  it 'should have API_VERSION defined' do
    expect(Parasut::Client.const_defined?('API_VERSION')).not_to be_nil
  end

  describe '#' do
    describe 'health' do
      it 'should return 200' do
        client = nil
        token = OAuth2::AccessToken.new(client, 'access_token')
        client = Parasut::Client.new(token)
        expect(client.health.resp.status_code).to eq(200)
      end
    end
  end
end
