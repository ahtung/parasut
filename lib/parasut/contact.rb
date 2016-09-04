# lib/parasut/contact.rb
module Parasut
  # Contact
  class Contact
    ATTRIBUTES = [
      :id, :name, :contact_type, :email, :balance, :tax_office,
      :tax_number, :archived, :category, :address, :contact_people
    ]

    # Attributes
    attr_accessor *ATTRIBUTES

    # Initializer
    def initialize
    end
  end
end
