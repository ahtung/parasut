require 'spec_helper'

describe Parasut::Product do
  subject { described_class.new }

  # Attributes
  Parasut::Product::ATTRIBUTES.each do |attribute|
    xit { should have_attr_accessor(attribute.to_sym) }
  end
end
