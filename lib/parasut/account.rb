# lib/parasut/account.rb
module Parasut
  # Account
  class Account
    ATTRIBUTES = [
      :id, :name, :account_type, :balance, :bank_name,
      :bank_branch, :bank_account_no, :iban, :archived
    ]

    # Attributes
    attr_accessor *ATTRIBUTES

    # Initializer
    def initialize(options)
      @id = options[:id]
      @name = options[:name]
      @account_type = options[:account_type]
      @balance = options[:balance]
      @bank_name = options[:bank_name]
      @bank_branch = options[:bank_branch]
      @bank_account_no = options[:bank_account_no]
      @iban = options[:iban]
      @archived = options[:archived]
    end
  end
end
