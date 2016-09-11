require 'spec_helper'

describe Parasut::Account do
  # Attributes
  Parasut::Account::ATTRIBUTES.each do |attribute|
    xit { should have_attr_accessor(attribute.to_sym) }
  end
end
