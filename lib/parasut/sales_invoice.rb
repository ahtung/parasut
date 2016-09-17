# lib/parasut/sales_invoice.rb
module Parasut
  # SalesInvoice
  class SalesInvoice
    include Her::Model
    extend Parasut::Paginated
    include_root_in_json true
  end
end
