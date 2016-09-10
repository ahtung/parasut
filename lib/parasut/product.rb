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
    private

    def self.instance_path(id)
      "#{collection_path}/#{id}"
    end

    def self.collection_path
      "100174/#{PATH}"
    end
  end
end
