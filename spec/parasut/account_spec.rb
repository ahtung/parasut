require 'spec_helper'

RSpec.describe Parasut::Account do
  it_behaves_like 'her model'

  describe '#' do
    let(:account) { described_class.find(1) }

    it 'transactions' do
      transactions = account.transactions
      expect(transactions.first).to be_instance_of(Parasut::Transaction)
    end
  end
end
