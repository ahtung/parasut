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

    # Constructor
    def initialize(options = {})
      self.id = options['id']
      self.name = options['name']
    end

    # Class methods
    def self.all
      JSON.parse(Parasut::Client.get(collection_path))['items']
    end

    def self.find(id)
      contact = JSON.parse(Parasut::Client.get(instance_path(id)))['contact']
      new(contact)
    end

    def self.create(attrs)
      JSON.parse(Parasut::Client.create(collection_path, attrs))['success'] == 'OK'
    end

    def self.instance_path(id)
      "#{collection_path}/#{id}"
    end

    def self.collection_path
      '100174/contacts'
    end

    # Instance methods
    def outstanding_payments
      JSON.parse(Parasut::Client.get("#{self.class.instance_path(id)}/outstanding_payments"))['items']
    end

    def delete
      JSON.parse(Parasut::Client.delete(self.class.instance_path(id)))['success'] == 'OK'
    end

    # Sample create request
    # {
    #   "contact": {
    #     "name": "ABC LTD. STI.",
    #     "contact_type": "company",
    #     "email": "user@mailhost.com",
    #     "tax_number": "1234567890",
    #     "tax_office": "Beyoglu",
    #     "category_id": 3,
    #     "city": "İstanbul",
    #     "district": "Beyoğlu",
    #     "address_attributes": {
    #       "address": "Guzel Mahalle Cicek sokak",
    #       "fax": null,
    #       "phone": "123 123 4567"
    #     },
    #     "contact_people_attributes": [
    #       {
    #         "name": "Ahmet Bilir",
    #         "phone": "532 123 4567",
    #         "email": "ahmet@mailhost.com",
    #         "notes": "Muhasebe Sorumlusu"
    #       }
    #     ]
    #   }
    # }
  end
end
