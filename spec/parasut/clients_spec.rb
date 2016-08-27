require 'spec_helper'

describe Parasut::Client do
  describe 'Client' do
    xit 'should be able to get access token' do
      client = Parasut::Client.new
      expect(client).not_to be(nil)
    end
  end
end
