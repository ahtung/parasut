require 'spec_helper'

describe Parasut::Contact do
  let(:options) do
  end

  #:id, :name, :contact_type, :email, :balance, :tax_office,
  #:tax_number, :archived, :category, :address, :contact_people

  # Attributes
  Parasut::Contact::ATTRIBUTES.each do |attribute|
    describe "should have attribute attr_accessor #{attribute.to_s}" do
      it attribute.to_s do
        contact = Parasut::Contact.new(attribute => 'Some string')
        expect(contact.send(attribute.to_s)).to eq('Some string')
      end
    end
  end

end
