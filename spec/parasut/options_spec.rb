require 'spec_helper'

describe Parasut::Options do

  it 'should be able to set with options' do
    options = Parasut.options do |o|
      o.client_id = 'String',
      o.client_secret = 'String',
      o.username = 'String',
      o.password = 'String',
      o.grant_type = 'String',
      o.redirect_uri = 'String'
    end
    expect(options).not_to be(nil)
  end
end
