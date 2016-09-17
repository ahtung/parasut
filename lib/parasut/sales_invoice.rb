# lib/parasut/sales_invoice.rb
module Parasut
  # SalesInvoice
  class SalesInvoice
    include Her::Model
    include_root_in_json true
    parse_root_in_json true

    has_one :e_document_status

    def e_document_type
      self.class.get_raw("sales_invoices/#{id}/e_document_type") do |parsed_data, response|
        parsed_data[:data][:e_document_type]
      end
    end
  end
end
