require 'spec_helper'

describe Parasut::Options do
  # Attributes
  describe 'should have attribute attr_accessor client_id' do
    it 'client_id' do
      options = Parasut::Options.new
      expect(options.client_id).to eq('client_id')
    end

    it 'client_id=(str)' do
      options = Parasut::Options.new
      options.client_id = 'some_string'
      expect(options.client_id).to eq('some_string')
    end
  end

  describe 'should have attribute attr_accessor client_secret' do
    it 'client_secret' do
      options = Parasut::Options.new
      expect(options.client_secret).to eq('client_secret')
    end

    it 'client_secret=(str)' do
      options = Parasut::Options.new
      options.client_secret = 'some_string'
      expect(options.client_secret).to eq('some_string')
    end
  end

  describe 'should have attribute attr_accessor username' do
    it 'username' do
      options = Parasut::Options.new
      expect(options.username).to eq('username')
    end

    it 'username=(str)' do
      options = Parasut::Options.new
      options.username = 'some_string'
      expect(options.username).to eq('some_string')
    end
  end

  describe 'should have attribute attr_accessor password' do
    it 'password' do
      options = Parasut::Options.new
      expect(options.password).to eq('password')
    end

    it 'password=(str)' do
      options = Parasut::Options.new
      options.password = 'some_string'
      expect(options.password).to eq('some_string')
    end
  end

  describe 'should have attribute attr_accessor company_id' do
    it 'company_id' do
      options = Parasut::Options.new
      expect(options.company_id).to eq('company_id')
    end

    it 'company_id=(str)' do
      options = Parasut::Options.new
      options.company_id = 'some_string'
      expect(options.company_id).to eq('some_string')
    end
  end

  describe 'should have attribute attr_accessor grant_type' do
    it 'grant_type' do
      options = Parasut::Options.new
      expect(options.grant_type).to eq('grant_type')
    end

    it 'grant_type=(str)' do
      options = Parasut::Options.new
      options.grant_type = 'some_string'
      expect(options.grant_type).to eq('some_string')
    end
  end

  describe 'should have attribute attr_accessor redirect_uri' do
    it 'redirect_uri' do
      options = Parasut::Options.new
      expect(options.redirect_uri).to eq('redirect_uri')
    end

    it 'redirect_uri=(str)' do
      options = Parasut::Options.new
      options.redirect_uri = 'some_string'
      expect(options.redirect_uri).to eq('some_string')
    end
  end
end
