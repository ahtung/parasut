# lib/parasut/account.rb
module Parasut
  # Account
  class Account
    include Her::Model
    include_root_in_json true
    parse_root_in_json true

    # Relations
    has_many :transactions
  end
end
