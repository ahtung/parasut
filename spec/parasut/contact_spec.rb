require 'spec_helper'

describe Parasut::Contact do
  # Attributes
  Parasut::Contact::ATTRIBUTES.each do |attribute|
    xit "should have attribute attr_accessor #{attribute}" do
      contact = Parasut::Contact.new(attribute => 'Some string')
      expect(contact.send(attribute.to_s)).to eq('Some string')
    end
  end

  # Class methods
  describe '.' do
    describe 'all' do
      xit 'returns all contacts' do
        expect(Parasut::Contact.all.length).not_to eq(0)
      end
    end

    describe 'find' do
      it 'returns a contact' do
        # binding.pry
        expect(Parasut::Contact.find(1205839)).not_to eq(0)
      end
    end

    describe 'delete' do
      it 'deletes a contact' do
        # binding.pry
        contact = Parasut::Contact.find(1205839)
        expect(contact.delete).to eq(true)
      end
    end
  end
end
