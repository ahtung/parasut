# lib/parasut/product.rb
module Parasut
  # Product
  class Product
    PATH = 'products'.freeze
    ATTRIBUTES = [:code, :name, :vat_rate, :currency, :list_price, :archived, :category].freeze

    # Attributes
    attr_accessor *ATTRIBUTES

    def self.all
      Parasut::Client.get('100174/products')
    end

    def self.find(id)
      Parasut::Client.get("100174/products/#{id}")
    end
  end
end
