require 'spec_helper'

RSpec.describe Parasut::Account do
  it_behaves_like 'her model'

  describe '#' do
    let(:account) { described_class.find(1) }

    it 'e_document_status' do
      expect(account.transactions).to be_instance_of(Parasut::Transaction)
    end

    it 'e_document_type' do
      expect(sales_invoice.e_document_type).to eq('e_invoice')
    end
  end
end

