# lib/parasut/sales_invoice.rb
module Parasut
  # Transaction
  class Transaction
    include Her::Model
    include_root_in_json true
    parse_root_in_json true
  end
end
