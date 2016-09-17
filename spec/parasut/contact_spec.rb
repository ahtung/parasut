require 'spec_helper'

RSpec.describe Parasut::Contact do
  it_behaves_like 'her model'

  describe '#' do
    let(:contact) { described_class.find(1) }

    it 'outstanding_payments' do
      expect(contact.outstanding_payments)
        .to eq(
          [{
            id: 1003,
            date: '2014-06-25',
            amount: '224.8',
            notes: 'Is bitimi',
            flow: 'in',
            paid_on: nil,
            payable_type: 'SalesInvoice',
            payable_id: 502
          }]
        )
    end

    it 'past_transactions' do
      expect(contact.past_transactions)
        .to eq(
          [{
            account_id: nil,
            account_name: nil,
            amount: '200.0',
            date: '2014-05-19',
            debit_credit: nil,
            description: 'On odeme',
            issue_date: nil,
            id: 2003,
            item_id: 502,
            transaction_type: 'collection'
          }]
        )
    end
  end
end
