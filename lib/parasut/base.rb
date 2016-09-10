# lib/parasut/product.rb
module Parasut
  # Product
  class Base
    def initialize(options)
      self.id = options['id']
    end

    def self.all
      JSON.parse(Parasut::Client.get(collection_path))['items']
    end

    def self.find(id)
      item_name = ActiveSupport::Inflector.singularize(path)
      item = JSON.parse(Parasut::Client.get(instance_path(id)))[item_name.to_s]
      new item
    end

    def self.create(attrs)
      JSON.parse(Parasut::Client.create(collection_path))['success'] == 'OK'
    end

    def delete
      JSON.parse(Parasut::Client.delete(self.class.instance_path(id)))['success'] == 'OK'
    end

    def self.path
      ''
    end

    def self.instance_path(id)
      "#{collection_path}/#{id}"
    end

    def self.collection_path
      "100174/#{path}"
    end
  end
end
