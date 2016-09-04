# lib/parasut/contact.rb
module Parasut
  # Contact
  class Contact < ActiveResource::Base
    PATH = 'contacts'.freeze
    ATTRIBUTES = [
      :id, :name, :contact_type, :email, :balance, :tax_office,
      :tax_number, :archived, :category, :address, :contact_people
    ].freeze

    # Attributes
    attr_accessor *ATTRIBUTES

    self.site = "https://api.parasut.com/v1"
    # self.class.headers['Authorization'] = "Bearer #{client.refresh_token['access_token']}"
  end
end
