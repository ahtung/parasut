require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'webmock/rspec'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'parasut'

RSpec.configure do |config|
  config.before(:suite) do
    Parasut.options do |options|
      options.client_id = ENV['PARASUT_CLIENT_ID']
      options.client_secret = ENV['PARASUT_CLIENT_SECRET']
      options.username = ENV['PARASUT_USERNAME']
      options.password = ENV['PARASUT_PASSWORD']
      options.company_id = ENV['PARASUT_COMPANY_ID']
    end
  end

  config.before(:each) do
    stub_request(:post, "https://api.parasut.com/oauth/token?client_id=#{ENV['PARASUT_CLIENT_ID']}&client_secret=#{ENV['PARASUT_CLIENT_SECRET']}&grant_type=password&password=#{ENV['PARASUT_PASSWORD']}&redirect_uri=urn:ietf:wg:oauth:2.0:oob&username=#{ENV['PARASUT_USERNAME']}")
      .to_return(status: 200, body: '{"access_token":"e9e13c1dec7e2f6c9550f8eb1801cf48e8b8caaca611508ff3330155f8bfbe99","token_type":"bearer","expires_in":7200,"refresh_token":"a880825d3e1ee8b0ad5dd5b0ed099d11aa175934fc63190149750589833242bf","scope":"public","created_at":1473538387}'.to_json, headers: {})

    stub_request(:post, "https://api.parasut.com/oauth/token?client_id=#{ENV['PARASUT_CLIENT_ID']}&client_secret=#{ENV['PARASUT_CLIENT_SECRET']}&grant_type=refresh_token&refresh_token=refresh_token")
      .to_return(status: 200, body: '{"access_token":"e9e13c1dec7e2f6c9550f8eb1801cf48e8b8caaca611508ff3330155f8bfbe99","token_type":"bearer","expires_in":7200,"refresh_token":"a880825d3e1ee8b0ad5dd5b0ed099d11aa175934fc63190149750589833242bf","scope":"public","created_at":1473538387}'.to_json, headers: {})

    stub_request(:get, 'https://api.parasut.com/v1/me')
      .to_return(status: 200, body: '', headers: {})

    stub_request(:get, 'https://api.parasut.com/v1/100174/contacts/1')
      .to_return(status: 200, body: {
  "contact": {
    "id": 1,
    "name": "ABC LTD. STI.",
    "email": "user@mailhost.com",
    "contact_type": "company",
    "tax_number": "1234567890",
    "tax_office": "Beyoglu",
    "balance": "0.0",
    "estimate_balance": "0.0",
    "archived": false,
    "contact_people": [
      {
        "id": 17,
        "name": "Ahmet Bilir",
        "phone": "532 123 4567",
        "email": "ahmet@mailhost.com",
        "notes": "Muhasebe Sorumlusu"
      }
    ],
    "address": {
      "id": 575,
      "address": "Guzel Mahalle Istanbul",
      "phone": "123 123 4567",
      "fax": nil
    },
    "category": {
      "id": 3,
      "name": "Mimarlık şirketleri",
      "bg_color": "5cbc68",
      "text_color": "f3f2f2"
    }
  }
}.to_json, headers: {})
    stub_request(:delete, 'https://api.parasut.com/v1/100174/contacts/1')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})
    stub_request(:get, 'https://api.parasut.com/v1/100174/contacts')
      .to_return(status: 200, body: {
  "items": [
    {
      "id": 1,
      "name": "ABC LTD. STI.",
      "email": "user@mailhost.com",
      "contact_type": "company",
      "tax_number": "1234567890",
      "tax_office": "Beyoglu",
      "balance": "0.0",
      "estimate_balance": "0.0",
      "archived": false,
      "contact_people": [
        {
          "id": 17,
          "name": "Ahmet Bilir",
          "phone": "532 123 4567",
          "email": "ahmet@mailhost.com",
          "notes": "Muhasebe Sorumlusu"
        }
      ],
      "address": {
        "id": 575,
        "address": "Guzel Mahalle Istanbul",
        "phone": "123 123 4567",
        "fax": nil
      },
      "category": {
        "id": 3,
        "name": "Mimarlık şirketleri",
        "bg_color": "5cbc68",
        "text_color": "f3f2f2"
      }
    }
  ],
  "meta": {
    "item_count": 1,
    "page_count": 1,
    "per_page": 25
  }
}.to_json, headers: {})
    stub_request(:post, 'https://api.parasut.com/v1/100174/contacts').to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})

    stub_request(:get, 'https://api.parasut.com/v1/100174/sales_invoices/1205839')
      .to_return(status: 200, body: {
  "items": [
    {
      "id": 1,
      "description": "Büyük müşteri Nisan 2014 hizmet",
      "issue_date": "2014-05-15",
      "due_date": nil,
      "gross_total": "1500.0",
      "total_discount": "0.0",
      "total_vat": "270.0",
      "created_at": "2014-05-15 00:00:00 UTC",
      "item_type": "invoice",
      "remaining": "0.0",
      "total_paid": "1770.0",
      "invoice_series": "A",
      "invoice_id": 1,
      "printed_at": nil,
      "archived": false,
      "billing_address": "Guzel Mahalle Istanbul",
      "billing_phone": "123 123 4567",
      "billing_fax": nil,
      "tax_office": "12345678901",
      "tax_number": "Beşiktaş",
      "shipment_date": nil,
      "net_total": "1770.0",
      "payment_status": "paid",
      "days_overdue": 0,
      "days_outstanding": 0,
      "category": {
        "id": 2,
        "name": "Aylık",
        "bg_color": "5cbc68",
        "text_color": "f3f2f2"
      },
      "contact": {
        "id": 1,
        "name": "ABC LTD. STI.",
        "tax_number": "1234567890",
        "tax_office": "Beyoglu",
        "balance": "0.0",
        "estimate_balance": "0.0",
        "address": {
          "id": 575,
          "address": "Guzel Mahalle Istanbul",
          "phone": "123 123 4567",
          "fax": nil
        }
      },
      "details": [
        {
          "id": 1,
          "detail_no": 1,
          "quantity": "1.0",
          "unit_price": "1500.0",
          "discount": "0.0",
          "vat_rate": "18.0",
          "discount_type": "amount",
          "discount_rate": nil,
          "product": {
            "id": 10,
            "name": "Aylık Bakım",
            "vat_rate": "18.0",
            "currency": "TRL",
            "list_price": "1500.0"
          }
        }
      ],
      "payments": [
        {
          "id": 1,
          "date": "2014-06-15",
          "payable_id": 1,
          "payable_type": "SalesInvoice",
          "amount": "1770.0",
          "notes": nil,
          "flow": "in",
          "is_overdue": false,
          "is_paid": true,
          "paid_on": "2014-06-15"
        }
      ]
    }
  ],
  "meta": {
    "item_count": 1,
    "page_count": 1,
    "per_page": 25
  }
}.to_json, headers: {})
    stub_request(:delete, 'https://api.parasut.com/v1/100174/sales_invoices/1205839')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})
    stub_request(:get, 'https://api.parasut.com/v1/100174/sales_invoices')
      .to_return(status: 200, body: { items: [{ id: '1205839' }] }.to_json, headers: {})
    stub_request(:post, 'https://api.parasut.com/v1/100174/sales_invoices').to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})
  end
end
