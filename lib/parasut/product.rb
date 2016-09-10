# lib/parasut/product.rb
module Parasut
  # Product
  class Product < Parasut::Base
    ATTRIBUTES = [:code, :name, :vat_rate, :currency, :list_price, :archived, :category].freeze

    # Attributes
    attr_accessor *ATTRIBUTES

    def initialize(options)
      self.id = options['id']
    end

    def self.path
      'products'
    end
  end
end
