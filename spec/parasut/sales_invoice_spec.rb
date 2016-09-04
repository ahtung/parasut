require 'spec_helper'

describe Parasut::SalesInvoice do
  # SalesInvoice
  Parasut::SalesInvoice::ATTRIBUTES.each do |attribute|
    it "should have attribute attr_accessor #{attribute.to_s}" do
      sales_invoice = Parasut::SalesInvoice.new(attribute => 'Some string')
      expect(sales_invoice.send(attribute.to_s)).to eq('Some string')
    end
  end
end
