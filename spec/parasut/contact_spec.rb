require 'spec_helper'

describe Parasut::Contact do
  # Attributes
  Parasut::Contact::ATTRIBUTES.each do |attribute|
    it "should have attribute attr_accessor #{attribute.to_s}" do
      contact = Parasut::Contact.new(attribute => 'Some string')
      expect(contact.send(attribute.to_s)).to eq('Some string')
    end
  end

end
