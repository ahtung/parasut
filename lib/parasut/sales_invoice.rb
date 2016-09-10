# lib/parasut/sales_invoice.rb
module Parasut
  # SalesInvoice
  class SalesInvoice < Parasut::Base
    ATTRIBUTES = [
      :id, :created_at, :item_type, :contact, :description, :issue_date,
      :invoice_series, :invoice_id, :category, :gross_total, :total_discount,
      :total_vat, :net_total, :total_paid, :remaining, :payment_status,
      :due_date, :days_overdue, :days_outstanding, :billing_address,
      :billing_phone, :billing_fax, :tax_office, :tax_number, :shipment_date,
      :printed_at, :archived, :details, :payments
    ]

    # Attributes
    attr_accessor *ATTRIBUTES

    # Initializer
    def initialize(options)
      @id = options[:id]
      @created_at = options[:created_at]
      @item_type = options[:item_type]
      @contact = options[:contact]
      @description = options[:description]
      @issue_date = options[:issue_date]
      @invoice_series = options[:invoice_series]
      @invoice_id = options[:invoice_id]
      @category = options[:category]
      @gross_total = options[:gross_total]
      @total_discount = options[:total_discount]
      @total_vat = options[:total_vat]
      @net_total = options[:net_total]
      @total_paid = options[:total_paid]
      @remaining = options[:remaining]
      @payment_status = options[:payment_status]
      @due_date = options[:due_date]
      @days_overdue = options[:days_overdue]
      @days_outstanding = options[:days_outstanding]
      @billing_address = options[:billing_address]
      @billing_phone = options[:billing_phone]
      @billing_fax = options[:billing_fax]
      @tax_office = options[:tax_office]
      @tax_number = options[:tax_number]
      @shipment_date = options[:shipment_date]
      @printed_at = options[:printed_at]
      @archived = options[:archived]
      @details = options[:details]
      @payments = options[:payments]
    end

    def self.path
      'sales_invoices'
    end
  end
end
