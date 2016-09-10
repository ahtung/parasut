# lib/parasut/product.rb
module Parasut
  # Product
  class Product
    ATTRIBUTES = [:code, :name, :vat_rate, :currency, :list_price, :archived, :category]

    # Attributes
    attr_accessor *ATTRIBUTES

    # Initializer
    def initialize(options)
      @code = options[:code]
      @name = options[:name]
      @vat_rate = options[:vat_rate]
      @currency = options[:currency]
      @list_price = options[:list_price]
      @archived = options[:archived]
      @category = options[:category]
    end

    def self.all
      Parasut::Client.get('100174/products')
    end

    def self.find(id)
      Parasut::Client.get("100174/products/#{id}")
    end
  end
end
