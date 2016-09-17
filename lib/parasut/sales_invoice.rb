# lib/parasut/sales_invoice.rb
module Parasut
  # SalesInvoice
  class SalesInvoice
    include Her::Model
    include_root_in_json true

    def convert_to_invoice
      post(['sales_invoices', id, 'convert_to_invoice'].join('/'))
    end

    def collect(options)
      post(['sales_invoices', id, 'payments'].join('/'), options)
    end

    def e_document_status
      self.class.get_raw("sales_invoices/1#{id}/e_document_status") do |parsed_data, response|
        parsed_data[:data]
      end
    end

    def e_document_type
      self.class.get_raw("sales_invoices/1#{id}/e_document_type") do |parsed_data, response|
        parsed_data[:data][:e_document_type]
      end
    end
  end
end
