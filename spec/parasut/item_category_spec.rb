require 'spec_helper'

describe Parasut::ItemCategory do
  # Attributes
  Parasut::ItemCategory::ATTRIBUTES.each do |attribute|
    it "should have attribute attr_accessor #{attribute.to_s}" do
      item_category = Parasut::ItemCategory.new(attribute => 'Some string')
      expect(item_category.send(attribute.to_s)).to eq('Some string')
    end
  end
end
