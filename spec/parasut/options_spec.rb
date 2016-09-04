require 'spec_helper'

describe Parasut::Options do
  let(:options) do
    Parasut.options do |o|
      o.client_id = 'client_id',
      o.client_secret = 'client_secret',
      o.username = 'username',
      o.password = 'password',
      o.grant_type = 'grant_type',
      o.redirect_uri = 'redirect_uri'
      o.company_id = 'company_id',
      o.authorize_url = 'authorize_url'
    end
  end

  # Attributes
  describe 'should have attribute attr_accessor authorize_url' do
    it 'authorize_url' do
      expect(options.authorize_url).to eq('authorize_url')
    end
  end

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

  describe 'should have attribute attr_accessor grant_type' do
    it 'grant_type' do
      expect(options.grant_type).to eq('grant_type')
    end
  end

  describe 'should have attribute attr_accessor redirect_uri' do
    it 'redirect_uri' do
      expect(options.redirect_uri).to eq('redirect_uri')
    end
  end
end
