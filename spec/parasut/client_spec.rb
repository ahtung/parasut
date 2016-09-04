require 'spec_helper'

RSpec.describe Parasut::Client do
  it 'should have API_VERSION defined' do
    expect(Parasut::Client.const_defined?('API_VERSION')).not_to be_nil
  end

  describe '#' do
    describe 'me' do
      fit 'should return 200' do
        client = Parasut::Client.new
        expect(client.me.resp.status_code).to eq(200)
      end
    end
  end
end
