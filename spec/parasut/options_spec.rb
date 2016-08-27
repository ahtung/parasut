require 'spec_helper'

describe Parasut::Options do
  # Attributes
  describe 'should have attribute attr_accessor client_id' do
    it 'client_id' do
      options = Parasut::Options.new
      allow(options).to receive(:client_id).and_return('client_id')
      expect(options.client_id).to eq('client_id')
    end

    it 'client_id=(str)' do
      options = Parasut::Options.new
      options.client_id = 'client_id'
      expect(options.client_id).to eq('client_id')
    end
  end

  # it { should allow_value('client_secret').for(:client_secret) }
#   it { should allow_value('username').for(:username) }
#   it { should allow_value('password').for(:password) }
#   it { should allow_value('company_id').for(:company_id) }
#   it { should allow_value('grant_type').for(:grant_type) }
#   it { should allow_value('redirect_uri').for(:redirect_uri) }
end
