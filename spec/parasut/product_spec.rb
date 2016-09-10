require 'spec_helper'

describe Parasut::Product do
  # Attributes
  Parasut::Product::ATTRIBUTES.each do |attribute|
    xit "should have attribute attr_accessor #{attribute.to_s}" do
      product = Parasut::Product.new(attribute => 'Some string')
      expect(product.send(attribute.to_s)).to eq('Some string')
    end
  end
end
