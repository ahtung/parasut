# lib/parasut/contact.rb
module Parasut
  # Contact
  class Contact < Parasut::Base
    ATTRIBUTES = [
      :id, :name, :contact_type, :email, :balance, :tax_office,
      :tax_number, :archived, :category, :address, :contact_people
    ].freeze

    # Attributes
    attr_accessor *ATTRIBUTES

    def initialize(options)
      self.id = options['id']
      self.name = options['name']
    end

    def self.path
      'contacts'
    end
  end
end
