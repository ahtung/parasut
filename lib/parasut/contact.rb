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

    def self.all
      Parasut::Client.get('100174/contacts')
    end

    def self.find(id)
      Parasut::Client.get("100174/contacts/#{id}")
    end
  end
end
