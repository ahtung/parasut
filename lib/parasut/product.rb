# lib/parasut/product.rb
module Parasut
  # Product
  class Product
    PATH = 'products'.freeze
    ATTRIBUTES = [:code, :name, :vat_rate, :currency, :list_price, :archived, :category].freeze

    # Attributes
    attr_accessor *ATTRIBUTES

    def self.all
      JSON.parse(Parasut::Client.get(collection_path))['items']
    end

    def self.find(id)
      product = JSON.parse(Parasut::Client.get(instance_path(id)))['product']
      new(contact)
    end

    private

    def self.instance_path(id)
      "#{collection_path}/#{id}"
    end

    def self.collection_path
      "100174/#{PATH}"
    end
  end
end
