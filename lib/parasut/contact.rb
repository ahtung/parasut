# lib/parasut/contact.rb
module Parasut
  # Contact
  class Contact
    PATH = 'contacts'.freeze
    ATTRIBUTES = [
      :id, :name, :contact_type, :email, :balance, :tax_office,
      :tax_number, :archived#, :category, :address, :contact_people
    ].freeze

    # Attributes
    attr_accessor *ATTRIBUTES

    # Constructor
    def initialize(options = {})
      @id = options['id']
      @name = options['name']
      @contact_type = options['contact_type']
      @email = options['email']
      @balance = options['balance']
      @tax_office = options['tax_office']
      @tax_number = options['tax_number']
      @archived = options['archived']
      # @category = options['category']
      # TODO address
      # TODO contact_people
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
    def attributes
      {
        contact: {
          name: @name,
          contact_type: @contact_type,
          email: @email,
          tax_number: @tax_number,
          tax_office: @tax_office,
          category_id: nil,
          city: 'Ankara',
          district: 'Ghetto',
          address_attributes: {
            address: 'Loosduinseweg 889',
            fax: '00',
            phone: '0626689471'
          },
          contact_people_attributes: [
            {
              name: 'Dunya Kirkali',
              phone: '0626689471',
              email: 'dunya@ahtung.co',
              notes: 'Weird'
            },
            {
              name: 'Dunya Kirkali',
              phone: '0626689471',
              email: 'dunya@gmail.co',
              notes: 'Good lookin'
            }
          ]
        }
      }
    end

    def reload
      JSON.parse(Parasut::Client.get(self.class.instance_path(id)))['contact'].each do |key, value|
        send("#{key}=", value) if [*ATTRIBUTES].include?(key.to_sym)
      end
    end

    def save
      Parasut::Client.update(self.class.instance_path(id), attributes) unless id.nil?
      Parasut::Client.create(self.class.instance_path(id), attributes) if id.nil?
    end

    def outstanding_payments
      JSON.parse(Parasut::Client.get("#{self.class.instance_path(id)}/outstanding_payments"))['items']
    end

    def past_transactions
      JSON.parse(Parasut::Client.get("#{self.class.instance_path(id)}/past_transactions"))['items']
    end

    def delete
      JSON.parse(Parasut::Client.delete(self.class.instance_path(id)))['success'] == 'OK'
    end
  end
end
