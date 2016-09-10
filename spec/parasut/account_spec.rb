require 'spec_helper'

describe Parasut::Account do
  # Attributes
  Parasut::Account::ATTRIBUTES.each do |attribute|
    it "should have attribute attr_accessor #{attribute.to_s}" do
      account = Parasut::Account.new(attribute => 'Some string')
      expect(account.send(attribute.to_s)).to eq('Some string')
    end
  end
end
