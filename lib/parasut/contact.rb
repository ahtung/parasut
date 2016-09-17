# lib/parasut/contact.rb
module Parasut
  # Contact
  class Contact
    include Her::Model
    include_root_in_json true
    parse_root_in_json true

    # Relations
    has_many :outstanding_payments, class_name: 'Payment'

    def past_transactions
      self.class.get_raw("sales_invoices/1#{id}/past_transactions") do |parsed_data, response|
        parsed_data[:data]
      end
    end
  end
end
