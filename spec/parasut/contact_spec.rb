require 'spec_helper'

RSpec.describe Parasut::Contact do
  it_behaves_like 'her model'

  describe '#' do
    let(:contact) { described_class.find(1) }

    it 'outstanding_payments' do
      expect(contact.outstanding_payments.first).to be_instance_of(Parasut::Payment)
    end

    it 'past_transactions' do
      expect(contact.past_transactions.first).to be_instance_of(Parasut::Transaction)
    end
  end
end
