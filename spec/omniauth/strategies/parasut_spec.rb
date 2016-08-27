require 'spec_helper'

describe Omniauth::Strategies::Parasut do
  xit 'should be able to authenticate API' do
    api = ParasutApi.new(OAUTH_TOKEN, 'http://api.parasut.dev:3000/v1')
    user = api.current_user

    expect(user.is_a? ParasutApi::User).to eq(true)
  end
end
