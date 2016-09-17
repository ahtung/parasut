# lib/parasut/account.rb
module Parasut
  # Account
  class Account
    include Her::Model
    has_many :transactions
    include_root_in_json true
  end
end
