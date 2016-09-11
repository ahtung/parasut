require 'spec_helper'

RSpec.describe Parasut::Contact do
  subject { described_class.new }

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
        expect(Parasut::Contact.find(1)).to be_instance_of(described_class)
      end
    end
  end

  # Instance methods
  describe '#' do
    describe 'delete' do
      it 'deletes a contact' do
        contact = Parasut::Contact.find(1)
        expect(contact.delete).to eq(true)
      end
    end

    describe 'outstanding_payments' do
      it 'returns outstanding payments' do
        contact = Parasut::Contact.find(1)
        expect(contact.outstanding_payments.length).not_to eq(0)
      end
    end

    describe 'past_transactions' do
      it 'returns past transactions' do
        contact = Parasut::Contact.find(1)
        expect(contact.past_transactions.length).not_to eq(0)
      end
    end
  end
end
