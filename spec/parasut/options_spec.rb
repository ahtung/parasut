require 'spec_helper'

describe Parasut::Options do
  let(:options) do
    Parasut.options do |o|
      o.client_id = 'client_id',
      o.client_secret = 'client_secret',
      o.username = 'username',
      o.password = 'password',
      o.company_id = 'company_id'
    end
  end

  # Attributes
  describe 'should have attribute attr_accessor client_id' do
    xit 'client_id' do
      expect(options.client_id).to eq('client_id')
    end
  end

  describe 'should have attribute attr_accessor client_secret' do
    it 'client_secret' do
      expect(options.client_secret).to eq('client_secret')
    end
  end

  describe 'should have attribute attr_accessor username' do
    it 'username' do
      expect(options.username).to eq('username')
    end
  end

  describe 'should have attribute attr_accessor password' do
    it 'password' do
      expect(options.password).to eq('password')
    end
  end

  describe 'should have attribute attr_accessor company_id' do
    xit 'company_id' do
      expect(options.company_id).to eq('company_id')
    end
  end
end
