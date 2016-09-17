require 'spec_helper'

RSpec.describe Parasut::SalesInvoice do
  it_behaves_like 'her model'

  describe '#' do
    let(:sales_invoice) { described_class.find(1) }

    it 'e_document_status' do
      expect(sales_invoice.e_document_status).to be_instance_of(Parasut::EDocumentStatus)
    end

    it 'e_document_type' do
      expect(sales_invoice.e_document_type).to eq('e_invoice')
    end
  end
end
