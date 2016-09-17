require 'webmock/rspec'
require 'json'
require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter])
SimpleCov.start
require 'webmock/rspec'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
require 'parasut'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = 'random'

  config.before(:suite) do
    Parasut.options do |options|
      options.client_id = 'client_id'
      options.client_secret = 'client_secret'
      options.username = 'username'
      options.password = 'password'
      options.company_id = 'company_id'
    end
  end

  config.before(:each) do
    stub_request(:post, 'https://api.parasut.com/oauth/token?client_id=client_id&client_secret=client_secret&grant_type=password&password=password&redirect_uri=urn:ietf:wg:oauth:2.0:oob&username=username')
      .to_return(status: 200, body: {
        access_token: 'e9e13c1dec7e2f6c9550f8eb1801cf48e8b8caaca611508ff3330155f8bfbe99',
        token_type: 'bearer',
        expires_in: 7200,
        refresh_token: 'refresh_token',
        scope: 'public',
        created_at: 1_473_538_387
      }.to_json, headers: {})

    stub_request(:post, 'https://api.parasut.com/oauth/token?client_id=client_id&client_secret=client_secret&grant_type=refresh_token&refresh_token=refresh_token')
      .to_return(status: 200, body: {
        access_token: 'e9e13c1dec7e2f6c9550f8eb1801cf48e8b8caaca611508ff3330155f8bfbe99',
        token_type: 'bearer',
        expires_in: 7200,
        refresh_token: 'a880825d3e1ee8b0ad5dd5b0ed099d11aa175934fc63190149750589833242bf',
        scope: 'public',
        created_at: 1_473_538_387
      }.to_json, headers: {})

    # /products
    # PUT /products/1
    stub_request(:put, 'https://api.parasut.com/v1/products/1')
      .to_return(status: 200, body: {
        product: {
          id: 1,
          code: nil,
          name: 'Gazete - dergi insert',
          vat_rate: '18.0',
          currency: 'TRL',
          list_price: '1500.00',
          archived: false,
          category: {
            id: 5,
            name: 'Baskı',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        }
      }.to_json, headers: {})

    # GET /products/1
    stub_request(:get, 'https://api.parasut.com/v1/products/1')
      .to_return(status: 200, body: {
        product: {
          id: 1,
          code: nil,
          name: 'Gazete - dergi insert',
          vat_rate: '18.0',
          currency: 'TRL',
          list_price: '1500.00',
          archived: false,
          category: {
            id: 5,
            name: 'Baskı',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        }
      }.to_json, headers: {})

    # DELETE /products/1
    stub_request(:delete, 'https://api.parasut.com/v1/products/1')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})

    # GET /products
    stub_request(:get, 'https://api.parasut.com/v1/products')
      .to_return(status: 200, body: {
        items: [
          {
            id: 1,
            code: nil,
            name: 'Gazete - dergi insert',
            vat_rate: '18.0',
            currency: 'TRL',
            list_price: '1500.00',
            archived: false,
            category: {
              id: 5,
              name: 'Baskı',
              bg_color: '5cbc68',
              text_color: 'f3f2f2'
            }
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # POST /products/1
    stub_request(:post, 'https://api.parasut.com/v1/products').to_return(status: 200, body: {
      product: {
        id: 1,
        code: nil,
        name: 'Gazete - dergi insert',
        vat_rate: '18.0',
        currency: 'TRL',
        list_price: '1500.00',
        archived: false,
        category: {
          id: 5,
          name: 'Baskı',
          bg_color: '5cbc68',
          text_color: 'f3f2f2'
        }
      }
    }.to_json, headers: {})

    # /contacts
    # PUT /contacts/1
    stub_request(:put, 'https://api.parasut.com/v1/contacts/1')
      .to_return(status: 200, body: {
        contact: {
          id: 1,
          name: 'ABC LTD. STI.',
          email: 'user@mailhost.com',
          contact_type: 'company',
          tax_number: '1234567890',
          tax_office: 'Beyoglu',
          balance: '0.0',
          estimate_balance: '0.0',
          archived: false,
          contact_people: [
            {
              id: 17,
              name: 'Ahmet Bilir',
              phone: '532 123 4567',
              email: 'ahmet@mailhost.com',
              notes: 'Muhasebe Sorumlusu'
            }
          ],
          address: {
            id: 575,
            address: 'Guzel Mahalle Istanbul',
            phone: '123 123 4567',
            fax: nil
          },
          category: {
            id: 3,
            name: 'Mimarlık şirketleri',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        }
      }
      .to_json, headers: {})

    # GET /sales_invoices/1/outstanding_payments
    stub_request(:get, 'https://api.parasut.com/v1/sales_invoices/1/outstanding_payments')
      .to_return(status: 200, body: {
        items: [
          {
            id: 1003,
            date: '2014-06-25',
            amount: '224.8',
            notes: 'Is bitimi',
            flow: 'in',
            paid_on: nil,
            payable_type: 'SalesInvoice',
            payable_id: 502
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # GET /sales_invoices/1/past_transactions
    stub_request(:get, 'https://api.parasut.com/v1/sales_invoices/1/past_transactions')
      .to_return(status: 200, body: {
        items: [
          {
            account_id: nil,
            account_name: nil,
            amount: '200.0',
            date: '2014-05-19',
            debit_credit: nil,
            description: 'On odeme',
            issue_date: nil,
            id: 2003,
            item_id: 502,
            transaction_type: 'collection'
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # GET /contacts/1
    stub_request(:get, 'https://api.parasut.com/v1/contacts/1')
      .to_return(status: 200, body: {
        contact: {
          id: 1,
          name: 'ABC LTD. STI.',
          email: 'user@mailhost.com',
          contact_type: 'company',
          tax_number: '1234567890',
          tax_office: 'Beyoglu',
          balance: '0.0',
          estimate_balance: '0.0',
          archived: false,
          contact_people: [
            {
              id: 17,
              name: 'Ahmet Bilir',
              phone: '532 123 4567',
              email: 'ahmet@mailhost.com',
              notes: 'Muhasebe Sorumlusu'
            }
          ],
          address: {
            id: 575,
            address: 'Guzel Mahalle Istanbul',
            phone: '123 123 4567',
            fax: nil
          },
          category: {
            id: 3,
            name: 'Mimarlık şirketleri',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        }
      }.to_json, headers: {})

    # GET /contacts/1/past_transactions
    stub_request(:get, 'https://api.parasut.com/v1/contacts/1/past_transactions')
      .to_return(status: 200, body: {
        items: [
          {
            account_id: nil,
            account_name: nil,
            amount: "200.0",
            date: "2014-05-19",
            debit_credit: nil,
            description: 'On odeme',
            issue_date: nil,
            id: 2003,
            item_id: 502,
            transaction_type: 'collection'
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # GET /contacts/1/outstanding_payments
    stub_request(:get, 'https://api.parasut.com/v1/contacts/1/outstanding_payments')
      .to_return(status: 200, body: {
        items: [
          {
            id: 1003,
            date: '2014-06-25',
            amount: '224.8',
            notes: 'Is bitimi',
            flow: 'in',
            paid_on: nil,
            payable_type: 'SalesInvoice',
            payable_id: 502
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # DELETE /contacts/1
    stub_request(:delete, 'https://api.parasut.com/v1/contacts/1')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})

    # GET /contacts
    stub_request(:get, 'https://api.parasut.com/v1/contacts')
      .to_return(status: 200, body: {
        items: [
          {
            id: 1,
            name: 'ABC LTD. STI.',
            email: 'user@mailhost.com',
            contact_type: 'company',
            tax_number: '1234567890',
            tax_office: 'Beyoglu',
            balance: '0.0',
            estimate_balance: '0.0',
            archived: false,
            contact_people: [
              {
                id: 17,
                name: 'Ahmet Bilir',
                phone: '532 123 4567',
                email: 'ahmet@mailhost.com',
                notes: 'Muhasebe Sorumlusu'
              }
            ],
            address: {
              id: 575,
              address: 'Guzel Mahalle Istanbul',
              phone: '123 123 4567',
              fax: nil
            },
            category: {
              id: 3,
              name: 'Mimarlık şirketleri',
              bg_color: '5cbc68',
              text_color: 'f3f2f2'
            }
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # POST /contacts/1
    stub_request(:post, 'https://api.parasut.com/v1/contacts').to_return(status: 200, body: {
      contact: {
        id: 1,
        name: 'ABC LTD. STI.',
        email: 'user@mailhost.com',
        contact_type: 'company',
        tax_number: '1234567890',
        tax_office: 'Beyoglu',
        balance: '0.0',
        estimate_balance: '0.0',
        archived: false,
        contact_people: [
          {
            id: 17,
            name: 'Ahmet Bilir',
            phone: '532 123 4567',
            email: 'ahmet@mailhost.com',
            notes: 'Muhasebe Sorumlusu'
          }
        ],
        address: {
          id: 575,
          address: 'Guzel Mahalle Istanbul',
          phone: '123 123 4567',
          fax: nil
        },
        category: {
          id: 3,
          name: 'Mimarlık şirketleri',
          bg_color: '5cbc68',
          text_color: 'f3f2f2'
        }
      }
    }.to_json, headers: {})

    # /item_categories
    # PUT /item_categories/1
    stub_request(:put, 'https://api.parasut.com/v1/item_categories/1')
      .to_return(status: 200, body: {
        item_category: {
          id: 3,
          category_type: 'Contact',
          name: 'Mimarlık şirketleri',
          bg_color: '5cbc68',
          text_color: 'f3f2f2'
        }
      }.to_json, headers: {})

    # GET /item_categories/1
    stub_request(:get, 'https://api.parasut.com/v1/item_categories/1')
      .to_return(status: 200, body: {
        item_category: {
          id: 1,
          category_type: 'Contact',
          name: 'Mimarlık şirketleri',
          bg_color: '5cbc68',
          text_color: 'f3f2f2'
        }
      }.to_json, headers: {})

    # DELETE /item_categories/1
    stub_request(:delete, 'https://api.parasut.com/v1/item_categories/1')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})

    # GET /item_categories
    stub_request(:get, 'https://api.parasut.com/v1/item_categories')
      .to_return(status: 200, body: {
        items: [
          {
            id: 3,
            category_type: 'Contact',
            name: 'Mimarlık şirketleri',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # POST /item_categories/1
    stub_request(:post, 'https://api.parasut.com/v1/item_categories').to_return(status: 200, body: {
      item_category: {
        id: 3,
        category_type: 'Contact',
        name: 'Mimarlık şirketleri',
        bg_color: '5cbc68',
        text_color: 'f3f2f2'
      }
    }.to_json, headers: {})

    # /accounts
    # GET /accounts/1
    stub_request(:get, 'https://api.parasut.com/v1/accounts/1?transactions=false')
      .to_return(status: 200, body: {
        account: {
          id: 1,
          name: 'TEB Ataşehir Vadesiz TL',
          account_type: 'bank',
          balance: '1000.00',
          bank_name: 'TEB',
          bank_branch: 'Ataşehir',
          bank_account_no: '12345',
          iban: '12345678',
          archived: false
        },
        transactions: nil
      }.to_json, headers: {})

    # GET /accounts/1
    stub_request(:get, 'https://api.parasut.com/v1/accounts/1')
      .to_return(status: 200, body: {
        account: {
          id: 1,
          name: 'TEB Ataşehir Vadesiz TL',
          account_type: 'bank',
          balance: '1000.00',
          bank_name: 'TEB',
          bank_branch: 'Ataşehir',
          bank_account_no: '12345',
          iban: '12345678',
          archived: false
        },
      }.to_json, headers: {})

      # GET /accounts/1/transactions
      stub_request(:get, 'https://api.parasut.com/v1/accounts/1/transactions')
        .to_return(status: 200, body: {
          transactions: {
            items: [
              {
                account_id: nil,
                account_name: nil,
                amount: '200.0',
                date: '2014-05-19',
                debit_credit: nil,
                description: 'Ön ödeme',
                issue_date: nil,
                id: 2003,
                item_id: 502,
                transaction_type: 'collection'
              }
            ],
            meta: {
              item_count: 1,
              page_count: 1,
              per_page: 25
            }
          }
        }.to_json, headers: {})

    # GET /accounts
    stub_request(:get, 'https://api.parasut.com/v1/accounts')
      .to_return(status: 200, body: {
        items: [
          {
            id: 1,
            name: 'Kasa Hesabı',
            account_type: 'cash',
            balance: '0.00'
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # /sales_invoices
    # GET /sales_invoices/1/e_document_status
    stub_request(:get, 'https://api.parasut.com/v1/sales_invoices/1/e_document_status')
      .to_return(status: 200, body: {
        sales_invoice_id: '1',
        type: 'e_archive',
        status: 'pending',
        errors: nil,
        pdf: nil
      }.to_json, headers: {})

    # GET /sales_invoices/1/e_document_type
    stub_request(:get, 'https://api.parasut.com/v1/sales_invoices/1/e_document_type')
      .to_return(status: 200, body: {
        e_document_type: 'e_invoice'
      }.to_json, headers: {})

    # PUT /sales_invoices/1
    stub_request(:put, 'https://api.parasut.com/v1/sales_invoices/1')
      .to_return(status: 200, body: {
        sales_invoice: {
          id: 1,
          description: 'Büyük müşteri Nisan 2014 hizmet',
          issue_date: '2014-05-15',
          due_date: nil,
          gross_total: '1500.0',
          total_discount: '0.0',
          total_vat: '270.0',
          created_at: '2014-05-15 00:00:00 UTC',
          item_type: 'invoice',
          remaining: '0.0',
          total_paid: '1770.0',
          invoice_series: 'A',
          invoice_id: 1,
          printed_at: nil,
          archived: false,
          billing_address: 'Guzel Mahalle Istanbul',
          billing_phone: '123 123 4567',
          billing_fax: nil,
          tax_office: '12345678901',
          tax_number: 'Beşiktaş',
          shipment_date: nil,
          net_total: '1770.0',
          payment_status: 'paid',
          days_overdue: 0,
          days_outstanding: 0,
          category: {
            id: 2,
            name: 'Aylık',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          },
          contact: {
            id: 1,
            name: 'ABC LTD. STI.',
            tax_number: '1234567890',
            tax_office: 'Beyoglu',
            balance: '0.0',
            estimate_balance: '0.0',
            address: {
              id: 575,
              address: 'Guzel Mahalle Istanbul',
              phone: '123 123 4567',
              fax: nil
            }
          },
          details: [
            {
              id: 1,
              detail_no: 1,
              quantity: '1.0',
              unit_price: '1500.0',
              discount: '0.0',
              vat_rate: '18.0',
              discount_type: 'amount',
              discount_rate: nil,
              product: {
                id: 10,
                name: 'Aylık Bakım',
                vat_rate: '18.0',
                currency: 'TRL',
                list_price: '1500.0'
              }
            }
          ],
          payments: [
            {
              id: 1,
              date: '2014-06-15',
              payable_id: 1,
              payable_type: 'SalesInvoice',
              amount: '1770.0',
              notes: nil,
              flow: 'in',
              is_overdue: false,
              is_paid: true,
              paid_on: '2014-06-15'
            }
          ]
        }
      }.to_json, headers: {})

    # GET /sales_invoices/1
    stub_request(:get, 'https://api.parasut.com/v1/sales_invoices/1')
      .to_return(status: 200, body: {
        sales_invoice: {
          id: 1,
          description: 'Büyük müşteri Nisan 2014 hizmet',
          issue_date: '2014-05-15',
          due_date: nil,
          gross_total: '1500.0',
          total_discount: '0.0',
          total_vat: '270.0',
          created_at: '2014-05-15 00:00:00 UTC',
          item_type: 'invoice',
          remaining: '0.0',
          total_paid: '1770.0',
          invoice_series: 'A',
          invoice_id: 1,
          printed_at: nil,
          archived: false,
          billing_address: 'Guzel Mahalle Istanbul',
          billing_phone: '123 123 4567',
          billing_fax: nil,
          tax_office: '12345678901',
          tax_number: 'Beşiktaş',
          shipment_date: nil,
          net_total: '1770.0',
          payment_status: 'paid',
          days_overdue: 0,
          days_outstanding: 0,
          category: {
            id: 2,
            name: 'Aylık',
            bg_color: '5cbc68',
            text_color: 'f3f2f2'
          },
          contact: {
            id: 1,
            name: 'ABC LTD. STI.',
            tax_number: '1234567890',
            tax_office: 'Beyoglu',
            balance: '0.0',
            estimate_balance: '0.0',
            address: {
              id: 575,
              address: 'Guzel Mahalle Istanbul',
              phone: '123 123 4567',
              fax: nil
            }
          },
          details: [
            {
              id: 1,
              detail_no: 1,
              quantity: '1.0',
              unit_price: '1500.0',
              discount: '0.0',
              vat_rate: '18.0',
              discount_type: 'amount',
              discount_rate: nil,
              product: {
                id: 10,
                name: 'Aylık Bakım',
                vat_rate: '18.0',
                currency: 'TRL',
                list_price: '1500.0'
              }
            }
          ],
          payments: [
            {
              id: 1,
              date: '2014-06-15',
              payable_id: 1,
              payable_type: 'SalesInvoice',
              amount: '1770.0',
              notes: nil,
              flow: 'in',
              is_overdue: false,
              is_paid: true,
              paid_on: '2014-06-15'
            }
          ]
        }
      }.to_json, headers: {})

    # DELETE /products/1
    stub_request(:delete, 'https://api.parasut.com/v1/sales_invoices/1')
      .to_return(status: 200, body: { success: 'OK' }.to_json, headers: {})

    # GET /sales_invoices
    stub_request(:get, 'https://api.parasut.com/v1/sales_invoices')
      .to_return(status: 200, body: {
        items: [
          {
            id: 1,
            description: 'Büyük müşteri Nisan 2014 hizmet',
            issue_date: '2014-05-15',
            due_date: nil,
            gross_total: '1500.0',
            total_discount: '0.0',
            total_vat: '270.0',
            created_at: '2014-05-15 00:00:00 UTC',
            item_type: 'invoice',
            remaining: '0.0',
            total_paid: '1770.0',
            invoice_series: 'A',
            invoice_id: 1,
            printed_at: nil,
            archived: false,
            billing_address: 'Guzel Mahalle Istanbul',
            billing_phone: '123 123 4567',
            billing_fax: nil,
            tax_office: '12345678901',
            tax_number: 'Beşiktaş',
            shipment_date: nil,
            net_total: '1770.0',
            payment_status: 'paid',
            days_overdue: 0,
            days_outstanding: 0,
            category: {
              id: 2,
              name: 'Aylık',
              bg_color: '5cbc68',
              text_color: 'f3f2f2'
            },
            contact: {
              id: 1,
              name: 'ABC LTD. STI.',
              tax_number: '1234567890',
              tax_office: 'Beyoglu',
              balance: '0.0',
              estimate_balance: '0.0',
              address: {
                id: 575,
                address: 'Guzel Mahalle Istanbul',
                phone: '123 123 4567',
                fax: nil
              }
            },
            details: [
              {
                id: 1,
                detail_no: 1,
                quantity: '1.0',
                unit_price: '1500.0',
                discount: '0.0',
                vat_rate: '18.0',
                discount_type: 'amount',
                discount_rate: nil,
                product: {
                  id: 10,
                  name: 'Aylık Bakım',
                  vat_rate: '18.0',
                  currency: 'TRL',
                  list_price: '1500.0'
                }
              }
            ],
            payments: [
              {
                id: 1,
                date: '2014-06-15',
                payable_id: 1,
                payable_type: 'SalesInvoice',
                amount: '1770.0',
                notes: nil,
                flow: 'in',
                is_overdue: false,
                is_paid: true,
                paid_on: '2014-06-15'
              }
            ]
          }
        ],
        meta: {
          item_count: 1,
          page_count: 1,
          per_page: 25
        }
      }.to_json, headers: {})

    # POST /sales_invoices/1
    stub_request(:post, 'https://api.parasut.com/v1/sales_invoices').to_return(status: 200, body: {
      sales_invoice: {
        id: 1,
        description: 'Büyük müşteri Nisan 2014 hizmet',
        issue_date: '2014-05-15',
        due_date: '2014-06-15',
        gross_total: '1500.0',
        total_discount: '0.0',
        total_vat: '270.0',
        created_at: '2014-05-15 00:00:00 UTC',
        item_type: 'invoice',
        remaining: '0.0',
        total_paid: '1770.0',
        invoice_series: 'A',
        invoice_id: 1,
        printed_at: nil,
        archived: false,
        billing_address: 'Guzel Mahalle Istanbul',
        billing_phone: '123 123 4567',
        billing_fax: nil,
        tax_office: '12345678901',
        tax_number: 'Beşiktaş',
        shipment_date: nil,
        net_total: '1770.0',
        payment_status: 'paid',
        days_overdue: 0,
        days_outstanding: 0,
        category: {
          id: 2,
          name: 'Aylık',
          bg_color: '5cbc68',
          text_color: 'f3f2f2'
        },
        contact: {
          id: 1,
          name: 'ABC LTD. STI.',
          tax_number: '1234567890',
          tax_office: 'Beyoglu',
          balance: '0.0',
          estimate_balance: '0.0',
          address: {
            id: 575,
            address: 'Guzel Mahalle Istanbul',
            phone: '123 123 4567',
            fax: nil
          }
        },
        details: [
          {
            id: 1,
            detail_no: 1,
            quantity: '1.0',
            unit_price: '1500.0',
            discount: '0.0',
            vat_rate: '18.0',
            discount_type: 'amount',
            discount_rate: nil,
            product: {
              id: 10,
              name: 'Aylık Bakım',
              vat_rate: '18.0',
              currency: 'TRL',
              list_price: '1500.0'
            }
          }
        ]
      }
    }.to_json, headers: {})
  end
end
