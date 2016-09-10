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
      it 'returns all contacts' do
        expect(Parasut::Contact.all.length).not_to eq(0)
      end
    end

    describe 'create' do
      it 'creates a new contact' do
        expect(Parasut::Contact.create(name: 'Dunya')).to eq(true)
      end
    end

    describe 'find' do
      it 'returns a contact instance' do
        expect(Parasut::Contact.find(1205839)).to be_instance_of(described_class)
      end
    end
  end

  # Instance methods
  describe '#' do
    describe 'delete' do
      it 'deletes a contact' do
        contact = Parasut::Contact.find(1205839)
        expect(contact.delete).to eq(true)
      end
    end
  end
end
