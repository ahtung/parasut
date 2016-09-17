# lib/parasut/contact.rb
module Parasut
  # Contact
  class Contact
    include Her::Model
    extend Parasut::Paginated
    include_root_in_json true
    parse_root_in_json true

    # Relations
    has_many :outstanding_payments, class_name: 'Payment'
    has_many :past_transactions, class_name: 'Transaction'
  end
end
