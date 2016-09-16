# lib/parasut/account.rb
module Parasut
  # Account
  class Account
    include Her::Model
    include Parasut::Paginated
    include_root_in_json true
  end
end
