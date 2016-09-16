# lib/parasut/sales_invoice.rb
module Parasut
  # SalesInvoice
  class SalesInvoice
    include Her::Model
    include Parasut::Paginated
    include_root_in_json true
  end
end
