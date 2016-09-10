# lib/parasut/contact.rb
module Parasut
  # Contact
  class Contact
    PATH = 'contacts'.freeze
    ATTRIBUTES = [
      :id, :name, :contact_type, :email, :balance, :tax_office,
      :tax_number, :archived, :category, :address, :contact_people
    ].freeze

    # Attributes
    attr_accessor *ATTRIBUTES

    def initialize(options)
      self.id = options['id']
    end

    def self.all
      JSON.parse(Parasut::Client.get(collection_path))['items']
    end

    def self.find(id)
      contact = JSON.parse(Parasut::Client.get(instance_path(id)))['contact']
      new(contact)
    end

    def delete
      JSON.parse(Parasut::Client.delete(self.class.instance_path(id)))['success'] == 'OK'
    end

    private

    def self.instance_path(id)
      "#{collection_path}/#{id}"
    end

    def self.collection_path
      "100174/contacts"
    end
  end
end
