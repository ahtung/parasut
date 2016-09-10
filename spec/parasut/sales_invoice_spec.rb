require 'spec_helper'

RSpec.describe Parasut::SalesInvoice do
  subject { described_class.new }

  # Attributes
  Parasut::SalesInvoice::ATTRIBUTES.each do |attribute|
    xit { should have_attr_accessor(attribute.to_sym) }
  end

  # Class methods
  describe '.' do
    describe 'all' do
      it 'returns all contacts' do
        expect(Parasut::SalesInvoice.all.length).not_to eq(0)
      end
    end

    describe 'create' do
      it 'creates a new contact' do
        expect(Parasut::SalesInvoice.create(name: 'Dunya')).to eq(true)
      end
    end

    describe 'find' do
      it 'returns a contact instance' do
        expect(Parasut::SalesInvoice.find(1_205_839)).to be_instance_of(described_class)
      end
    end
  end

  # Instance methods
  describe '#' do
    describe 'delete' do
      it 'deletes a contact' do
        contact = Parasut::SalesInvoice.find(1_205_839)
        expect(contact.delete).to eq(true)
      end
    end
  end
end
