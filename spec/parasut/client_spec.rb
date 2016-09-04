require 'spec_helper'

RSpec.describe Parasut::Client do
  it 'should have BASE_URL defined' do
    expect(Parasut::Client.const_defined?('BASE_URL')).not_to be_nil
  end

  it 'should have AUTH_PATH defined' do
    expect(Parasut::Client.const_defined?('AUTH_PATH')).not_to be_nil
  end

  it 'should have TOKEN_PATH defined' do
    expect(Parasut::Client.const_defined?('TOKEN_PATH')).not_to be_nil
  end

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
